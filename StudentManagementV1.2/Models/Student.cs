using System;

namespace StudentManagementV1._2.Models
{
    public class Student
    {
        public int StudentID { get; set; }
        public int UserID { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public DateTime? DateOfBirth { get; set; }
        public string? Gender { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? ZipCode { get; set; }
        public string? EmergencyContactName { get; set; }
        public string? EmergencyContactPhone { get; set; }
        public DateTime? EnrollmentDate { get; set; }
        
        // Navigation property
        public User? User { get; set; }

        // Display full name
        public string FullName => $"{FirstName} {LastName}";
    }
}
