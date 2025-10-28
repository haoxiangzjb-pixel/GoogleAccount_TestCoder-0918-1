import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - these would typically come from environment variables or config
        connection_params = {
            'host': 'localhost',      # or your database server IP
            'database': 'your_db',    # replace with your database name
            'user': 'your_user',      # replace with your username
            'password': 'your_pass',  # replace with your password
            'port': '5432'            # default PostgreSQL port
        }
        
        print("Attempting to connect to PostgreSQL...")
        connection = psycopg2.connect(**connection_params)
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"Connected successfully! PostgreSQL version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return False
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return False

if __name__ == "__main__":
    success = connect_to_postgres()
    if success:
        print("PostgreSQL connection test completed successfully.")
    else:
        print("PostgreSQL connection test failed.")
        sys.exit(1)