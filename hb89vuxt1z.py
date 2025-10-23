import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgresql():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - update these with your actual database credentials
        connection = psycopg2.connect(
            host="localhost",          # Database host
            database="your_database",  # Database name
            user="your_username",      # Database user
            password="your_password",  # Database password
            port="5432"               # Database port (default is 5432)
        )
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print("Successfully connected to PostgreSQL!")
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return False
    except Exception as e:
        print(f"Unexpected error: {e}")
        return False

def execute_query(connection, query):
    """
    Execute a given SQL query on the PostgreSQL database
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        return result
    except psycopg2.Error as error:
        print(f"Error executing query: {error}")
        return None

if __name__ == "__main__":
    print("Attempting to connect to PostgreSQL...")
    success = connect_to_postgresql()
    
    if success:
        print("Connection test completed successfully!")
    else:
        print("Connection test failed!")
        sys.exit(1)