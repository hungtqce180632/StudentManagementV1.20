-- Create the database
CREATE DATABASE StudentManagementDB;
GO

-- Use the newly created database
USE StudentManagementDB;
GO

-- Create Users table for authentication and role management
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL CHECK (Role IN ('admin', 'teacher', 'student', 'parent')),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    CreatedDate DATETIME DEFAULT GETDATE(),
    LastLoginDate DATETIME
);

-- Create Students table for student-specific information
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT UNIQUE NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    State NVARCHAR(50),
    ZipCode NVARCHAR(10),
    EmergencyContactName NVARCHAR(100),
    EmergencyContactPhone NVARCHAR(20),
    EnrollmentDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Teachers table for teacher-specific information
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT UNIQUE NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    State NVARCHAR(50),
    ZipCode NVARCHAR(10),
    HireDate DATE,
    Qualifications NVARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Parents table for parent-specific information
CREATE TABLE Parents (
    ParentID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT UNIQUE NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    RelationshipToStudent NVARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create ParentStudents table to link parents with their children
CREATE TABLE ParentStudents (
    ParentID INT,
    StudentID INT,
    PRIMARY KEY (ParentID, StudentID),
    FOREIGN KEY (ParentID) REFERENCES Parents(ParentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create Courses table for course information
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    CreditHours INT,
    Department NVARCHAR(50),
    Prerequisites NVARCHAR(255)
);

-- Create Enrollments table to manage student course enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE,
    Status NVARCHAR(20) DEFAULT 'enrolled',
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create Assignments table for course assignments
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    DueDate DATE,
    MaxScore DECIMAL(5,2),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create Submissions table for student assignment submissions
CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY IDENTITY(1,1),
    AssignmentID INT NOT NULL,
    StudentID INT NOT NULL,
    SubmissionDate DATETIME,
    FilePath NVARCHAR(255),
    Score DECIMAL(5,2),
    Feedback NVARCHAR(MAX),
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create Grades table to store student grades
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY IDENTITY(1,1),
    EnrollmentID INT NOT NULL,
    GradeType NVARCHAR(20) NOT NULL,
    SubmissionID INT,
    Score DECIMAL(5,2),
    MaxScore DECIMAL(5,2),
    Weight DECIMAL(5,2),
    Comments NVARCHAR(MAX),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID),
    FOREIGN KEY (SubmissionID) REFERENCES Submissions(SubmissionID)
);

-- Create Attendance table for tracking student attendance
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    EnrollmentID INT NOT NULL,
    Date DATE NOT NULL,
    Status NVARCHAR(10) NOT NULL CHECK (Status IN ('present', 'absent', 'late')),
    Comments NVARCHAR(255),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);

-- Create Schedules table for class scheduling
CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT NOT NULL,
    TeacherID INT NOT NULL,
    RoomNumber NVARCHAR(20),
    DayOfWeek INT CHECK (DayOfWeek BETWEEN 1 AND 7),
    StartTime TIME,
    EndTime TIME,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

-- Create Fees table for managing student fees
CREATE TABLE Fees (
    FeeID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    FeeType NVARCHAR(50) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    DueDate DATE,
    Status NVARCHAR(20) DEFAULT 'unpaid',
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create Payments table for recording fee payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    FeeID INT NOT NULL,
    PaymentDate DATE,
    AmountPaid DECIMAL(10,2),
    PaymentMethod NVARCHAR(50),
    FOREIGN KEY (FeeID) REFERENCES Fees(FeeID)
);

-- Create Books table for library management
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Author NVARCHAR(100),
    ISBN NVARCHAR(20),
    Publisher NVARCHAR(100),
    PublicationYear INT,
    CopiesAvailable INT DEFAULT 1
);

-- Create Borrowings table for tracking book loans
CREATE TABLE Borrowings (
    BorrowingID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT NOT NULL,
    StudentID INT NOT NULL,
    BorrowDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FineAmount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create Routes table for transportation management
CREATE TABLE Routes (
    RouteID INT PRIMARY KEY IDENTITY(1,1),
    RouteName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    BusNumber NVARCHAR(20)
);

-- Create BusAssignments table to assign students to bus routes
CREATE TABLE BusAssignments (
    AssignmentID INT PRIMARY KEY IDENTITY(1,1),
    RouteID INT NOT NULL,
    StudentID INT NOT NULL,
    PickupPoint NVARCHAR(100),
    DropoffPoint NVARCHAR(100),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create HealthRecords table for student health information
CREATE TABLE HealthRecords (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    AllergyInfo NVARCHAR(MAX),
    ImmunizationRecords NVARCHAR(MAX),
    MedicalConditions NVARCHAR(MAX),
    DoctorContact NVARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create BehaviorIncidents table for tracking student behavior
CREATE TABLE BehaviorIncidents (
    IncidentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    IncidentDate DATE,
    Description NVARCHAR(MAX),
    ActionTaken NVARCHAR(255),
    ReportedBy INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ReportedBy) REFERENCES Users(UserID)
);

-- Create Activities table for extracurricular activities
CREATE TABLE Activities (
    ActivityID INT PRIMARY KEY IDENTITY(1,1),
    ActivityName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    Category NVARCHAR(50)
);

-- Create StudentActivities table to link students to activities
CREATE TABLE StudentActivities (
    StudentActivityID INT PRIMARY KEY IDENTITY(1,1),
    ActivityID INT NOT NULL,
    StudentID INT NOT NULL,
    JoinDate DATE,
    Role NVARCHAR(50),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Create Events table for managing school events
CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    EventDate DATETIME,
    Location NVARCHAR(100)
);

-- Create EventRSVPs table for event attendance tracking
CREATE TABLE EventRSVPs (
    RSVP_ID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT NOT NULL,
    UserID INT NOT NULL,
    Status NVARCHAR(20),
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Documents table for storing related documents
CREATE TABLE Documents (
    DocumentID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    FilePath NVARCHAR(255),
    UploadedBy INT,
    UploadDate DATETIME,
    StudentID INT,
    CourseID INT,
    Description NVARCHAR(255),
    FOREIGN KEY (UploadedBy) REFERENCES Users(UserID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create Notifications table for sending messages to users
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    RecipientID INT NOT NULL,
    Message NVARCHAR(MAX),
    SentDate DATETIME,
    ReadStatus BIT DEFAULT 0,
    NotificationType NVARCHAR(20),
    FOREIGN KEY (RecipientID) REFERENCES Users(UserID)
);