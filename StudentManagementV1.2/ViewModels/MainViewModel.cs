using StudentManagementV1._2.Models;
using StudentManagementV1._2.Services;
using System;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;
using CommunityToolkit.Mvvm.Input;

namespace StudentManagementV1._2.ViewModels
{
    public class MainViewModel : ViewModelBase
    {
        private ObservableCollection<Student> _students = new ObservableCollection<Student>();
        private ObservableCollection<Course> _courses = new ObservableCollection<Course>();
        
        public ObservableCollection<Student> Students
        {
            get => _students;
            set => SetProperty(ref _students, value);
        }
        
        public ObservableCollection<Course> Courses
        {
            get => _courses;
            set => SetProperty(ref _courses, value);
        }
        
        // Command declarations
        public ICommand LoadDataCommand { get; }
        
        public MainViewModel()
        {
            // Initialize commands
            LoadDataCommand = new RelayCommand(LoadData);
            
            // Load data on startup
            LoadData();
        }
        
        private void LoadData()
        {
            try
            {
                // Will be completed with actual data loading from the repository
                LoadStudentCount();
                LoadTeacherCount();
                LoadCourseCount();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading data: {ex.Message}", "Database Error", 
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        
        private void LoadStudentCount()
        {
            try
            {
                var result = DatabaseService.ExecuteScalar("SELECT COUNT(*) FROM Students");
                TotalStudents = result != null ? Convert.ToInt32(result) : 0;
            }
            catch
            {
                TotalStudents = 0;
            }
        }
        
        private void LoadTeacherCount()
        {
            try
            {
                var result = DatabaseService.ExecuteScalar("SELECT COUNT(*) FROM Teachers");
                TotalTeachers = result != null ? Convert.ToInt32(result) : 0;
            }
            catch
            {
                TotalTeachers = 0;
            }
        }
        
        private void LoadCourseCount()
        {
            try
            {
                var result = DatabaseService.ExecuteScalar("SELECT COUNT(*) FROM Courses");
                TotalCourses = result != null ? Convert.ToInt32(result) : 0;
            }
            catch
            {
                TotalCourses = 0;
            }
        }
        
        private int _totalStudents;
        public int TotalStudents
        {
            get => _totalStudents;
            set => SetProperty(ref _totalStudents, value);
        }
        
        private int _totalTeachers;
        public int TotalTeachers
        {
            get => _totalTeachers;
            set => SetProperty(ref _totalTeachers, value);
        }
        
        private int _totalCourses;
        public int TotalCourses
        {
            get => _totalCourses;
            set => SetProperty(ref _totalCourses, value);
        }
    }
}
