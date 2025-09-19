#!/usr/bin/env python3
"""
PostgreSQL Connection Script using psycopg2
This script demonstrates how to connect to a PostgreSQL database.
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgres():
    """Establish a connection to PostgreSQL database."""
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your database server IP
            'port': '5432'        # default PostgreSQL port
        }
        
        # Establishing the connection
        conn = psycopg2.connect(**conn_params)
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a simple query
        cur.execute("SELECT version();")
        
        # Fetch result
        db_version = cur.fetchone()
        print(f"Connected to PostgreSQL database. Version: {db_version[0]}")
        
        # Close the cursor and connection
        cur.close()
        conn.close()
        
        return True
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL database: {e}")
        return False

def main():
    """Main function to run the script."""
    print("Attempting to connect to PostgreSQL database...")
    if connect_to_postgres():
        print("Connection successful!")
    else:
        print("Connection failed!")

if __name__ == "__main__":
    main()