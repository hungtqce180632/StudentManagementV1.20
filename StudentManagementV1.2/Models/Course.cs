namespace StudentManagementV1._2.Models
{
    public class Course
    {
        public int CourseID { get; set; }
        public string CourseName { get; set; } = string.Empty;
        public string? Description { get; set; }
        public int? CreditHours { get; set; }
        public string? Department { get; set; }
        public string? Prerequisites { get; set; }
    }
}
