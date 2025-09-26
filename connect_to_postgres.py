"""
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
Remember to install psycopg2 first: pip install psycopg2-binary
"""

import psycopg2
from psycopg2 import sql

# Database connection parameters
DB_CONFIG = {
    'dbname': 'your_database_name',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or your database host
    'port': '5432'        # or your database port
}

def connect_to_db():
    """
    Connects to the PostgreSQL database using the parameters in DB_CONFIG.
    Returns the connection object if successful, otherwise None.
    """
    try:
        print("Attempting to connect to PostgreSQL...")
        connection = psycopg2.connect(**DB_CONFIG)
        print("Connection successful!")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    """
    Main function to run the script.
    """
    conn = connect_to_db()
    if conn:
        # Example: Print connection info
        print(f"Connected to database: {conn.info.dbname}")
        # It's important to close the connection when done
        conn.close()
        print("Connection closed.")

if __name__ == "__main__":
    main()