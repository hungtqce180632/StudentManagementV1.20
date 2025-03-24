using StudentManagementV1._2.Services;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Windows;

namespace StudentManagementV1._2;

/// <summary>
/// Interaction logic for App.xaml
/// </summary>
public partial class App : Application
{
    protected override void OnStartup(StartupEventArgs e)
    {
        base.OnStartup(e);
        
        try
        {
            // Copy Database.sql to output directory if it doesn't exist
            string outputDir = AppDomain.CurrentDomain.BaseDirectory;
            string sourceDbPath = Path.Combine(Directory.GetCurrentDirectory(), "Database.sql");
            string targetDbPath = Path.Combine(outputDir, "Database.sql");
            
            if (File.Exists(sourceDbPath) && !File.Exists(targetDbPath))
            {
                File.Copy(sourceDbPath, targetDbPath);
            }
            
            // Initialize database 
            if (!DatabaseInitializer.InitializeDatabase("sa", "123"))
            {
                MessageBox.Show("Could not initialize the database. The application will close.",
                    "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                this.Shutdown();
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Application startup error: {ex.Message}",
                "Startup Error", MessageBoxButton.OK, MessageBoxImage.Error);
            this.Shutdown();
        }
    }
}

