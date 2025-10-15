import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

# Load environment variables (if using .env file)
load_dotenv()

def execute_select_query():
    """
    Executes a SELECT query on MySQL database and prints the results
    """
    connection = None
    try:
        # Database connection parameters
        # You can either hardcode them here or use environment variables
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST', 'localhost'),  # Default to localhost
            database=os.getenv('DB_NAME', 'your_database'),
            user=os.getenv('DB_USER', 'your_username'),
            password=os.getenv('DB_PASSWORD', 'your_password')
        )
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            
            # Create cursor object
            cursor = connection.cursor()
            
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table LIMIT 10;"  # Change 'your_table' to actual table name
            
            # Execute the query
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Print column names
            column_names = [desc[0] for desc in cursor.description]
            print(f"Columns: {column_names}")
            
            # Print the records
            print(f"Total number of rows: {cursor.rowcount}")
            print("\nRecords:")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("\nMySQL connection is closed")

def execute_custom_select_query(query):
    """
    Executes a custom SELECT query on MySQL database
    """
    connection = None
    try:
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST', 'localhost'),
            database=os.getenv('DB_NAME', 'your_database'),
            user=os.getenv('DB_USER', 'your_username'),
            password=os.getenv('DB_PASSWORD', 'your_password')
        )
        
        if connection.is_connected():
            cursor = connection.cursor(dictionary=True)  # Returns results as dictionaries
            cursor.execute(query)
            records = cursor.fetchall()
            
            print(f"Query executed: {query}")
            print(f"Number of records returned: {len(records)}")
            
            for record in records:
                print(record)
                
    except Error as e:
        print(f"Error while executing query: {e}")
        
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    print("Executing default SELECT query...")
    execute_select_query()
    
    print("\n" + "="*50 + "\n")
    
    # Example of executing a custom SELECT query
    custom_query = "SELECT * FROM information_schema.tables WHERE table_schema = DATABASE() LIMIT 5;"
    print("Executing custom SELECT query...")
    execute_custom_select_query(custom_query)