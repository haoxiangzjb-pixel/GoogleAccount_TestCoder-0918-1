import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

# Load environment variables if a .env file exists
load_dotenv()

def execute_select_query():
    """
    Executes a SELECT query on MySQL database
    """
    connection = None
    cursor = None
    
    try:
        # Database connection parameters
        host = os.getenv('DB_HOST', 'localhost')
        database = os.getenv('DB_NAME', 'your_database')
        user = os.getenv('DB_USER', 'your_username')
        password = os.getenv('DB_PASSWORD', 'your_password')
        port = int(os.getenv('DB_PORT', 3306))
        
        # Establish database connection
        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        if connection.is_connected():
            print(f"Connected to MySQL database: {database}")
            
            # Create cursor object
            cursor = connection.cursor()
            
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table LIMIT 10;"
            
            # Execute the SELECT query
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Get column names
            column_names = [desc[0] for desc in cursor.description]
            print(f"Column names: {column_names}")
            
            # Print the records
            print(f"Total records found: {len(records)}")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close database connection
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    print("Starting MySQL SELECT query execution...")
    execute_select_query()