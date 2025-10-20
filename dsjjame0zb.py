import psycopg2
from psycopg2 import sql
import random
import string

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - these would typically come from environment variables
        connection = psycopg2.connect(
            host="localhost",          # or your PostgreSQL server address
            database="your_database",  # replace with your database name
            user="your_username",      # replace with your username
            password="your_password"   # replace with your password
        )
        
        print("Successfully connected to PostgreSQL!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        print("PostgreSQL connection closed.")
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    connect_to_postgres()