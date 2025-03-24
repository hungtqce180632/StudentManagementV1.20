using Microsoft.Data.SqlClient;
using StudentManagementV1._2.Models;
using StudentManagementV1._2.Services;
using System;
using System.Collections.Generic;
using System.Data;

namespace StudentManagementV1._2.Repositories
{
    public class StudentRepository : IRepository<Student>
    {
        public IEnumerable<Student> GetAll()
        {
            List<Student> students = new List<Student>();
            string query = "SELECT * FROM Students";
            
            DataTable dataTable = DatabaseService.ExecuteQuery(query);
            
            foreach (DataRow row in dataTable.Rows)
            {
                students.Add(MapRowToStudent(row));
            }
            
            return students;
        }

        public Student GetById(int id)
        {
            string query = "SELECT * FROM Students WHERE StudentID = @StudentID";
            var parameter = new SqlParameter("@StudentID", SqlDbType.Int) { Value = id };
            
            DataTable dataTable = DatabaseService.ExecuteQuery(query, parameter);
            
            if (dataTable.Rows.Count > 0)
            {
                return MapRowToStudent(dataTable.Rows[0]);
            }
            
            return null;
        }

        public void Add(Student student)
        {
            string query = @"INSERT INTO Students 
                          (UserID, FirstName, LastName, DateOfBirth, Gender, Address, City, State, ZipCode, 
                           EmergencyContactName, EmergencyContactPhone, EnrollmentDate) 
                          VALUES 
                          (@UserID, @FirstName, @LastName, @DateOfBirth, @Gender, @Address, @City, @State, @ZipCode, 
                           @EmergencyContactName, @EmergencyContactPhone, @EnrollmentDate)";
            
            var parameters = CreateParametersFromStudent(student);
            DatabaseService.ExecuteNonQuery(query, parameters);
        }

        public void Update(Student student)
        {
            string query = @"UPDATE Students 
                          SET UserID = @UserID, 
                              FirstName = @FirstName, 
                              LastName = @LastName, 
                              DateOfBirth = @DateOfBirth, 
                              Gender = @Gender, 
                              Address = @Address, 
                              City = @City, 
                              State = @State, 
                              ZipCode = @ZipCode, 
                              EmergencyContactName = @EmergencyContactName, 
                              EmergencyContactPhone = @EmergencyContactPhone, 
                              EnrollmentDate = @EnrollmentDate 
                          WHERE StudentID = @StudentID";
            
            var parameters = CreateParametersFromStudent(student);
            parameters = parameters.Append(new SqlParameter("@StudentID", SqlDbType.Int) { Value = student.StudentID }).ToArray();
            
            DatabaseService.ExecuteNonQuery(query, parameters);
        }

        public void Delete(int id)
        {
            string query = "DELETE FROM Students WHERE StudentID = @StudentID";
            var parameter = new SqlParameter("@StudentID", SqlDbType.Int) { Value = id };
            
            DatabaseService.ExecuteNonQuery(query, parameter);
        }
        
        private Student MapRowToStudent(DataRow row)
        {
            return new Student
            {
                StudentID = Convert.ToInt32(row["StudentID"]),
                UserID = Convert.ToInt32(row["UserID"]),
                FirstName = row["FirstName"].ToString(),
                LastName = row["LastName"].ToString(),
                DateOfBirth = row["DateOfBirth"] != DBNull.Value ? Convert.ToDateTime(row["DateOfBirth"]) : null,
                Gender = row["Gender"] != DBNull.Value ? row["Gender"].ToString() : null,
                Address = row["Address"] != DBNull.Value ? row["Address"].ToString() : null,
                City = row["City"] != DBNull.Value ? row["City"].ToString() : null,
                State = row["State"] != DBNull.Value ? row["State"].ToString() : null,
                ZipCode = row["ZipCode"] != DBNull.Value ? row["ZipCode"].ToString() : null,
                EmergencyContactName = row["EmergencyContactName"] != DBNull.Value ? row["EmergencyContactName"].ToString() : null,
                EmergencyContactPhone = row["EmergencyContactPhone"] != DBNull.Value ? row["EmergencyContactPhone"].ToString() : null,
                EnrollmentDate = row["EnrollmentDate"] != DBNull.Value ? Convert.ToDateTime(row["EnrollmentDate"]) : null
            };
        }
        
        private SqlParameter[] CreateParametersFromStudent(Student student)
        {
            return new SqlParameter[]
            {
                new SqlParameter("@UserID", SqlDbType.Int) { Value = student.UserID },
                new SqlParameter("@FirstName", SqlDbType.NVarChar, 50) { Value = student.FirstName },
                new SqlParameter("@LastName", SqlDbType.NVarChar, 50) { Value = student.LastName },
                new SqlParameter("@DateOfBirth", SqlDbType.Date) { 
                    Value = student.DateOfBirth.HasValue ? (object)student.DateOfBirth.Value : DBNull.Value },
                new SqlParameter("@Gender", SqlDbType.NVarChar, 10) { 
                    Value = !string.IsNullOrEmpty(student.Gender) ? (object)student.Gender : DBNull.Value },
                new SqlParameter("@Address", SqlDbType.NVarChar, 255) { 
                    Value = !string.IsNullOrEmpty(student.Address) ? (object)student.Address : DBNull.Value },
                new SqlParameter("@City", SqlDbType.NVarChar, 50) { 
                    Value = !string.IsNullOrEmpty(student.City) ? (object)student.City : DBNull.Value },
                new SqlParameter("@State", SqlDbType.NVarChar, 50) { 
                    Value = !string.IsNullOrEmpty(student.State) ? (object)student.State : DBNull.Value },
                new SqlParameter("@ZipCode", SqlDbType.NVarChar, 10) { 
                    Value = !string.IsNullOrEmpty(student.ZipCode) ? (object)student.ZipCode : DBNull.Value },
                new SqlParameter("@EmergencyContactName", SqlDbType.NVarChar, 100) { 
                    Value = !string.IsNullOrEmpty(student.EmergencyContactName) ? (object)student.EmergencyContactName : DBNull.Value },
                new SqlParameter("@EmergencyContactPhone", SqlDbType.NVarChar, 20) { 
                    Value = !string.IsNullOrEmpty(student.EmergencyContactPhone) ? (object)student.EmergencyContactPhone : DBNull.Value },
                new SqlParameter("@EnrollmentDate", SqlDbType.Date) { 
                    Value = student.EnrollmentDate.HasValue ? (object)student.EnrollmentDate.Value : DBNull.Value }
            };
        }
    }
}
