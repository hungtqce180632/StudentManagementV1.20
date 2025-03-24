using Microsoft.Data.SqlClient;
using System;
using System.IO;
using System.Text;
using System.Windows;

namespace StudentManagementV1._2.Services
{
    public static class DatabaseInitializer
    {
        public static bool InitializeDatabase(string username, string password, string server = "localhost")
        {
            try
            {
                // First, connect to master database to check if our database exists
                string masterConnectionString = $"Server={server};Database=master;User Id={username};Password={password};TrustServerCertificate=True;";
                
                // Check if database exists
                bool databaseExists = false;
                
                using (SqlConnection connection = new SqlConnection(masterConnectionString))
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) FROM sys.databases WHERE name = 'StudentManagementDB'";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        int result = (int)command.ExecuteScalar();
                        databaseExists = result > 0;
                    }
                    
                    // If database doesn't exist, create it
                    if (!databaseExists)
                    {
                        // Path to our SQL script
                        string scriptPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Database.sql");
                        
                        if (!File.Exists(scriptPath))
                        {
                            scriptPath = Path.Combine(Directory.GetCurrentDirectory(), "Database.sql");
                        }
                        
                        if (File.Exists(scriptPath))
                        {
                            // Read the SQL script
                            string script = File.ReadAllText(scriptPath);
                            
                            // Split the script by GO statements to execute batch by batch
                            string[] batches = script.Split(new[] { "GO" }, StringSplitOptions.RemoveEmptyEntries);
                            
                            foreach (string batch in batches)
                            {
                                if (!string.IsNullOrWhiteSpace(batch))
                                {
                                    try
                                    {
                                        using (SqlCommand command = new SqlCommand(batch, connection))
                                        {
                                            command.ExecuteNonQuery();
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        MessageBox.Show($"Error executing SQL batch: {ex.Message}", "Database Initialization Error",
                                            MessageBoxButton.OK, MessageBoxImage.Error);
                                        return false;
                                    }
                                }
                            }
                            
                            MessageBox.Show("Database created successfully!", "Database Initialization",
                                MessageBoxButton.OK, MessageBoxImage.Information);
                        }
                        else
                        {
                            MessageBox.Show("Database script not found. Please make sure 'Database.sql' exists in the application directory.", 
                                "Database Initialization Error", MessageBoxButton.OK, MessageBoxImage.Error);
                            return false;
                        }
                    }
                }
                
                // Now initialize the connection to our new database
                DatabaseService.Initialize(username, password, "StudentManagementDB", server);
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error initializing database: {ex.Message}", "Database Initialization Error",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                return false;
            }
        }
    }
}
