USE [StudentManagementDB]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 3/24/2025 6:20:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[AssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DueDate] [date] NULL,
	[MaxScore] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[EnrollmentID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
	[Comments] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BehaviorIncidents]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BehaviorIncidents](
	[IncidentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[IncidentDate] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[ActionTaken] [nvarchar](255) NULL,
	[ReportedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IncidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Author] [nvarchar](100) NULL,
	[ISBN] [nvarchar](20) NULL,
	[Publisher] [nvarchar](100) NULL,
	[PublicationYear] [int] NULL,
	[CopiesAvailable] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrowings]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowings](
	[BorrowingID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[BorrowDate] [date] NULL,
	[DueDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[FineAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusAssignments]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusAssignments](
	[AssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[PickupPoint] [nvarchar](100) NULL,
	[DropoffPoint] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreditHours] [int] NULL,
	[Department] [nvarchar](50) NULL,
	[Prerequisites] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[FilePath] [nvarchar](255) NULL,
	[UploadedBy] [int] NULL,
	[UploadDate] [datetime] NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[EnrollmentDate] [date] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventRSVPs]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventRSVPs](
	[RSVP_ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RSVP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[EventDate] [datetime] NULL,
	[Location] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fees]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[FeeID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[FeeType] [nvarchar](50) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[DueDate] [date] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[EnrollmentID] [int] NOT NULL,
	[GradeType] [nvarchar](20) NOT NULL,
	[SubmissionID] [int] NULL,
	[Score] [decimal](5, 2) NULL,
	[MaxScore] [decimal](5, 2) NULL,
	[Weight] [decimal](5, 2) NULL,
	[Comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthRecords]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthRecords](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[AllergyInfo] [nvarchar](max) NULL,
	[ImmunizationRecords] [nvarchar](max) NULL,
	[MedicalConditions] [nvarchar](max) NULL,
	[DoctorContact] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[RecipientID] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[SentDate] [datetime] NULL,
	[ReadStatus] [bit] NULL,
	[NotificationType] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parents]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parents](
	[ParentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[RelationshipToStudent] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParentStudents]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentStudents](
	[ParentID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[FeeID] [int] NOT NULL,
	[PaymentDate] [date] NULL,
	[AmountPaid] [decimal](10, 2) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[RouteName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[BusNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[RoomNumber] [nvarchar](20) NULL,
	[DayOfWeek] [int] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentActivities]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentActivities](
	[StudentActivityID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[JoinDate] [date] NULL,
	[Role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[EmergencyContactName] [nvarchar](100) NULL,
	[EmergencyContactPhone] [nvarchar](20) NULL,
	[EnrollmentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Submissions]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submissions](
	[SubmissionID] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[SubmissionDate] [datetime] NULL,
	[FilePath] [nvarchar](255) NULL,
	[Score] [decimal](5, 2) NULL,
	[Feedback] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[HireDate] [date] NULL,
	[Qualifications] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/24/2025 6:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activities] ON 

INSERT [dbo].[Activities] ([ActivityID], [ActivityName], [Description], [Category]) VALUES (1, N'Chess Club', N'Weekly chess meetings', N'Clubs')
SET IDENTITY_INSERT [dbo].[Activities] OFF
GO
SET IDENTITY_INSERT [dbo].[Assignments] ON 

INSERT [dbo].[Assignments] ([AssignmentID], [CourseID], [Title], [Description], [DueDate], [MaxScore]) VALUES (1, 1, N'Algebra Basics', N'Solve the equations provided.', CAST(N'2023-10-01' AS Date), CAST(100.00 AS Decimal(5, 2)))
INSERT [dbo].[Assignments] ([AssignmentID], [CourseID], [Title], [Description], [DueDate], [MaxScore]) VALUES (2, 2, N'Essay on World War II', N'Write a 500-word essay.', CAST(N'2023-10-15' AS Date), CAST(50.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Assignments] OFF
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([AttendanceID], [EnrollmentID], [Date], [Status], [Comments]) VALUES (1, 1, CAST(N'2023-09-05' AS Date), N'present', NULL)
INSERT [dbo].[Attendance] ([AttendanceID], [EnrollmentID], [Date], [Status], [Comments]) VALUES (2, 2, CAST(N'2023-09-05' AS Date), N'present', NULL)
INSERT [dbo].[Attendance] ([AttendanceID], [EnrollmentID], [Date], [Status], [Comments]) VALUES (3, 3, CAST(N'2023-09-05' AS Date), N'absent', N'Sick')
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[BehaviorIncidents] ON 

INSERT [dbo].[BehaviorIncidents] ([IncidentID], [StudentID], [IncidentDate], [Description], [ActionTaken], [ReportedBy]) VALUES (1, 2, CAST(N'2023-09-20' AS Date), N'Talking in class', N'Warning', 2)
SET IDENTITY_INSERT [dbo].[BehaviorIncidents] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Publisher], [PublicationYear], [CopiesAvailable]) VALUES (1, N'Algebra for Beginners', N'John Author', N'1234567890123', N'Math Publishers', 2010, 5)
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Publisher], [PublicationYear], [CopiesAvailable]) VALUES (2, N'World History', N'Jane Historian', N'9876543210987', N'History Press', 2015, 3)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Borrowings] ON 

INSERT [dbo].[Borrowings] ([BorrowingID], [BookID], [StudentID], [BorrowDate], [DueDate], [ReturnDate], [FineAmount]) VALUES (1, 1, 1, CAST(N'2023-09-10' AS Date), CAST(N'2023-09-24' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Borrowings] OFF
GO
SET IDENTITY_INSERT [dbo].[BusAssignments] ON 

INSERT [dbo].[BusAssignments] ([AssignmentID], [RouteID], [StudentID], [PickupPoint], [DropoffPoint]) VALUES (1, 1, 1, N'Main St', N'School Gate')
SET IDENTITY_INSERT [dbo].[BusAssignments] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [CreditHours], [Department], [Prerequisites]) VALUES (1, N'Mathematics 101', N'Introduction to Algebra', 3, N'Mathematics', NULL)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [CreditHours], [Department], [Prerequisites]) VALUES (2, N'History 101', N'World History', 3, N'History', NULL)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [CreditHours], [Department], [Prerequisites]) VALUES (3, N'Science 101', N'Basic Physics', 4, N'Science', N'Mathematics 101')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([DocumentID], [Title], [FilePath], [UploadedBy], [UploadDate], [StudentID], [CourseID], [Description]) VALUES (1, N'Birth Certificate', N'/documents/student1_birthcert.pdf', 1, CAST(N'2023-09-01T00:00:00.000' AS DateTime), 1, NULL, N'Official birth certificate')
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollments] ON 

INSERT [dbo].[Enrollments] ([EnrollmentID], [StudentID], [CourseID], [EnrollmentDate], [Status]) VALUES (1, 1, 1, CAST(N'2023-09-01' AS Date), N'enrolled')
INSERT [dbo].[Enrollments] ([EnrollmentID], [StudentID], [CourseID], [EnrollmentDate], [Status]) VALUES (2, 1, 2, CAST(N'2023-09-01' AS Date), N'enrolled')
INSERT [dbo].[Enrollments] ([EnrollmentID], [StudentID], [CourseID], [EnrollmentDate], [Status]) VALUES (3, 2, 1, CAST(N'2023-09-01' AS Date), N'enrolled')
INSERT [dbo].[Enrollments] ([EnrollmentID], [StudentID], [CourseID], [EnrollmentDate], [Status]) VALUES (4, 3, 3, CAST(N'2023-09-01' AS Date), N'enrolled')
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
GO
SET IDENTITY_INSERT [dbo].[EventRSVPs] ON 

INSERT [dbo].[EventRSVPs] ([RSVP_ID], [EventID], [UserID], [Status]) VALUES (1, 1, 7, N'Attending')
SET IDENTITY_INSERT [dbo].[EventRSVPs] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventID], [EventName], [Description], [EventDate], [Location]) VALUES (1, N'Parent-Teacher Meeting', N'Discuss student progress', CAST(N'2023-10-05T18:00:00.000' AS DateTime), N'School Auditorium')
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Fees] ON 

INSERT [dbo].[Fees] ([FeeID], [StudentID], [FeeType], [Amount], [DueDate], [Status]) VALUES (1, 1, N'Tuition', CAST(500.00 AS Decimal(10, 2)), CAST(N'2023-10-01' AS Date), N'unpaid')
INSERT [dbo].[Fees] ([FeeID], [StudentID], [FeeType], [Amount], [DueDate], [Status]) VALUES (2, 2, N'Tuition', CAST(500.00 AS Decimal(10, 2)), CAST(N'2023-10-01' AS Date), N'unpaid')
INSERT [dbo].[Fees] ([FeeID], [StudentID], [FeeType], [Amount], [DueDate], [Status]) VALUES (3, 3, N'Tuition', CAST(500.00 AS Decimal(10, 2)), CAST(N'2023-10-01' AS Date), N'unpaid')
SET IDENTITY_INSERT [dbo].[Fees] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([GradeID], [EnrollmentID], [GradeType], [SubmissionID], [Score], [MaxScore], [Weight], [Comments]) VALUES (1, 1, N'Assignment', 1, CAST(90.00 AS Decimal(5, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), N'First assignment grade')
INSERT [dbo].[Grades] ([GradeID], [EnrollmentID], [GradeType], [SubmissionID], [Score], [MaxScore], [Weight], [Comments]) VALUES (2, 3, N'Assignment', 2, CAST(85.00 AS Decimal(5, 2)), CAST(100.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), N'First assignment grade')
INSERT [dbo].[Grades] ([GradeID], [EnrollmentID], [GradeType], [SubmissionID], [Score], [MaxScore], [Weight], [Comments]) VALUES (3, 2, N'Assignment', 3, CAST(45.00 AS Decimal(5, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), N'Essay grade')
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthRecords] ON 

INSERT [dbo].[HealthRecords] ([RecordID], [StudentID], [AllergyInfo], [ImmunizationRecords], [MedicalConditions], [DoctorContact]) VALUES (1, 1, N'Peanuts', N'Fully immunized', NULL, N'Dr. Smith 123-456-7890')
SET IDENTITY_INSERT [dbo].[HealthRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([NotificationID], [RecipientID], [Message], [SentDate], [ReadStatus], [NotificationType]) VALUES (1, 7, N'Reminder: Parent-Teacher Meeting on 2023-10-05', CAST(N'2023-09-25T00:00:00.000' AS DateTime), 0, N'Event')
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Parents] ON 

INSERT [dbo].[Parents] ([ParentID], [UserID], [FirstName], [LastName], [RelationshipToStudent]) VALUES (1, 7, N'Jane', N'Doe', N'Mother')
INSERT [dbo].[Parents] ([ParentID], [UserID], [FirstName], [LastName], [RelationshipToStudent]) VALUES (2, 8, N'Bob', N'Johnson', N'Father')
SET IDENTITY_INSERT [dbo].[Parents] OFF
GO
INSERT [dbo].[ParentStudents] ([ParentID], [StudentID]) VALUES (1, 1)
INSERT [dbo].[ParentStudents] ([ParentID], [StudentID]) VALUES (1, 2)
INSERT [dbo].[ParentStudents] ([ParentID], [StudentID]) VALUES (2, 3)
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [FeeID], [PaymentDate], [AmountPaid], [PaymentMethod]) VALUES (1, 1, CAST(N'2023-09-15' AS Date), CAST(250.00 AS Decimal(10, 2)), N'Credit Card')
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([RouteID], [RouteName], [Description], [BusNumber]) VALUES (1, N'Route A', N'Downtown to School', N'Bus 1')
SET IDENTITY_INSERT [dbo].[Routes] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([ScheduleID], [CourseID], [TeacherID], [RoomNumber], [DayOfWeek], [StartTime], [EndTime]) VALUES (1, 1, 1, N'101', 1, CAST(N'09:00:00' AS Time), CAST(N'10:30:00' AS Time))
INSERT [dbo].[Schedules] ([ScheduleID], [CourseID], [TeacherID], [RoomNumber], [DayOfWeek], [StartTime], [EndTime]) VALUES (2, 2, 2, N'102', 2, CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentActivities] ON 

INSERT [dbo].[StudentActivities] ([StudentActivityID], [ActivityID], [StudentID], [JoinDate], [Role]) VALUES (1, 1, 1, CAST(N'2023-09-15' AS Date), N'Member')
SET IDENTITY_INSERT [dbo].[StudentActivities] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [UserID], [FirstName], [LastName], [DateOfBirth], [Gender], [Address], [City], [State], [ZipCode], [EmergencyContactName], [EmergencyContactPhone], [EnrollmentDate]) VALUES (1, 4, N'John', N'Doe', CAST(N'2005-01-01' AS Date), N'Male', N'123 Main St', N'Anytown', N'Anystate', N'12345', N'Jane Doe', N'0987654321', CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Students] ([StudentID], [UserID], [FirstName], [LastName], [DateOfBirth], [Gender], [Address], [City], [State], [ZipCode], [EmergencyContactName], [EmergencyContactPhone], [EnrollmentDate]) VALUES (2, 5, N'Jane', N'Smith', CAST(N'2005-02-01' AS Date), N'Female', N'456 Elm St', N'Anytown', N'Anystate', N'12345', N'John Smith', N'0987654322', CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Students] ([StudentID], [UserID], [FirstName], [LastName], [DateOfBirth], [Gender], [Address], [City], [State], [ZipCode], [EmergencyContactName], [EmergencyContactPhone], [EnrollmentDate]) VALUES (3, 6, N'Alice', N'Johnson', CAST(N'2005-03-01' AS Date), N'Female', N'789 Oak St', N'Anytown', N'Anystate', N'12345', N'Bob Johnson', N'0987654323', CAST(N'2023-09-01' AS Date))
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Submissions] ON 

INSERT [dbo].[Submissions] ([SubmissionID], [AssignmentID], [StudentID], [SubmissionDate], [FilePath], [Score], [Feedback]) VALUES (1, 1, 1, CAST(N'2023-09-25T00:00:00.000' AS DateTime), N'/submissions/student1_algebra.pdf', CAST(90.00 AS Decimal(5, 2)), N'Good work!')
INSERT [dbo].[Submissions] ([SubmissionID], [AssignmentID], [StudentID], [SubmissionDate], [FilePath], [Score], [Feedback]) VALUES (2, 1, 2, CAST(N'2023-09-26T00:00:00.000' AS DateTime), N'/submissions/student2_algebra.pdf', CAST(85.00 AS Decimal(5, 2)), N'Needs improvement on quadratic equations.')
INSERT [dbo].[Submissions] ([SubmissionID], [AssignmentID], [StudentID], [SubmissionDate], [FilePath], [Score], [Feedback]) VALUES (3, 2, 1, CAST(N'2023-10-10T00:00:00.000' AS DateTime), N'/submissions/student1_wwii_essay.docx', CAST(45.00 AS Decimal(5, 2)), N'Well-written, but missing citations.')
SET IDENTITY_INSERT [dbo].[Submissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherID], [UserID], [FirstName], [LastName], [DateOfBirth], [Gender], [Address], [City], [State], [ZipCode], [HireDate], [Qualifications]) VALUES (1, 2, N'Emily', N'Clark', CAST(N'1980-05-15' AS Date), N'Female', N'101 Pine St', N'Anytown', N'Anystate', N'12345', CAST(N'2010-08-01' AS Date), N'M.Ed. in Mathematics')
INSERT [dbo].[Teachers] ([TeacherID], [UserID], [FirstName], [LastName], [DateOfBirth], [Gender], [Address], [City], [State], [ZipCode], [HireDate], [Qualifications]) VALUES (2, 3, N'Michael', N'Brown', CAST(N'1975-07-20' AS Date), N'Male', N'202 Maple St', N'Anytown', N'Anystate', N'12345', CAST(N'2005-08-01' AS Date), N'Ph.D. in History')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [Email], [PhoneNumber], [CreatedDate], [LastLoginDate]) VALUES (1, N'admin', N'hashedpassword', N'admin', N'admin@example.com', N'1234567890', CAST(N'2025-03-24T18:19:24.410' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [Email], [PhoneNumber], [CreatedDate], [LastLoginDate]) VALUES (2, N'teacher1', N'hashedpassword', N'teacher', N'teacher1@example.com', N'1234567891', CAST(N'2025-03-24T18:19:24.410' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [Email], [PhoneNumber], [CreatedDate], [LastLoginDate]) VALUES (3, N'teacher2', N'hashedpassword', N'teacher', N'teacher2@example.com', N'1234567892', CAST(N'2025-03-24T18:19:24.410' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [Email], [PhoneNumber], [CreatedDate], [LastLoginDate]) VALUES (4, N'student1', N'hashedpassword', N'student', N'student1@example.com', N'1234567893', CAST(N'2025-03-24T18:19:24.410' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [Email], [PhoneNumber], [CreatedDate], [LastLoginDate]) VALUES (5, N'student2', N'hashedpassword', N'student', N'student2@example.com', N'1234567894', CAST(N'2025-03-24T18:19:24.410' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [Email], [PhoneNumber], [CreatedDate], [LastLoginDate]) VALUES (6, N'student3', N'hashedpassword', N'student', N'student3@example.com', N'1234567895', CAST(N'2025-03-24T18:19:24.410' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [Email], [PhoneNumber], [CreatedDate], [LastLoginDate]) VALUES (7, N'parent1', N'hashedpassword', N'parent', N'parent1@example.com', N'1234567896', CAST(N'2025-03-24T18:19:24.410' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [Email], [PhoneNumber], [CreatedDate], [LastLoginDate]) VALUES (8, N'parent2', N'hashedpassword', N'parent', N'parent2@example.com', N'1234567897', CAST(N'2025-03-24T18:19:24.410' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ__Parents__1788CCAD8DD6192E]    Script Date: 3/24/2025 6:20:52 PM ******/
ALTER TABLE [dbo].[Parents] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Students__1788CCADFDA0E854]    Script Date: 3/24/2025 6:20:52 PM ******/
ALTER TABLE [dbo].[Students] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Teachers__1788CCAD42A88B7B]    Script Date: 3/24/2025 6:20:52 PM ******/
ALTER TABLE [dbo].[Teachers] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4054587AA]    Script Date: 3/24/2025 6:20:52 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ((1)) FOR [CopiesAvailable]
GO
ALTER TABLE [dbo].[Borrowings] ADD  DEFAULT ((0)) FOR [FineAmount]
GO
ALTER TABLE [dbo].[Enrollments] ADD  DEFAULT ('enrolled') FOR [Status]
GO
ALTER TABLE [dbo].[Fees] ADD  DEFAULT ('unpaid') FOR [Status]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [ReadStatus]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([EnrollmentID])
REFERENCES [dbo].[Enrollments] ([EnrollmentID])
GO
ALTER TABLE [dbo].[BehaviorIncidents]  WITH CHECK ADD FOREIGN KEY([ReportedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[BehaviorIncidents]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Borrowings]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Borrowings]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[BusAssignments]  WITH CHECK ADD FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
GO
ALTER TABLE [dbo].[BusAssignments]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([UploadedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[EventRSVPs]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
GO
ALTER TABLE [dbo].[EventRSVPs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Fees]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([EnrollmentID])
REFERENCES [dbo].[Enrollments] ([EnrollmentID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([SubmissionID])
REFERENCES [dbo].[Submissions] ([SubmissionID])
GO
ALTER TABLE [dbo].[HealthRecords]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([RecipientID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Parents]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ParentStudents]  WITH CHECK ADD FOREIGN KEY([ParentID])
REFERENCES [dbo].[Parents] ([ParentID])
GO
ALTER TABLE [dbo].[ParentStudents]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([FeeID])
REFERENCES [dbo].[Fees] ([FeeID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[StudentActivities]  WITH CHECK ADD FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activities] ([ActivityID])
GO
ALTER TABLE [dbo].[StudentActivities]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Submissions]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[Assignments] ([AssignmentID])
GO
ALTER TABLE [dbo].[Submissions]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  (([Status]='late' OR [Status]='absent' OR [Status]='present'))
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD CHECK  (([DayOfWeek]>=(1) AND [DayOfWeek]<=(7)))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='parent' OR [Role]='student' OR [Role]='teacher' OR [Role]='admin'))
GO
