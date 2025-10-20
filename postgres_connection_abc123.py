import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - update these with your actual database credentials
        connection = psycopg2.connect(
            host="localhost",          # Database host
            database="your_database",  # Database name
            user="your_username",      # Username
            password="your_password",  # Password
            port="5432"               # Port number (default is 5432)
        )
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        return connection, cursor
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL database: {error}")
        return None, None

def close_connection(connection, cursor):
    """
    Close the database connection and cursor
    """
    if cursor:
        cursor.close()
    if connection:
        connection.close()
        print("PostgreSQL connection closed.")

def main():
    """
    Main function to demonstrate PostgreSQL connection
    """
    print("Attempting to connect to PostgreSQL...")
    
    connection, cursor = connect_to_postgres()
    
    if connection and cursor:
        # Perform database operations here
        # For example, you could execute queries, insert data, etc.
        pass
    
    close_connection(connection, cursor)

if __name__ == "__main__":
    main()