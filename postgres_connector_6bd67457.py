#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgres():
    """Establish a connection to the PostgreSQL database."""
    try:
        # Database connection parameters
        connection_params = {
            'host': 'localhost',
            'database': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'port': '5432'
        }
        
        # Establishing the connection
        connection = psycopg2.connect(**connection_params)
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query
        cursor.execute("SELECT version();")
        
        # Fetch result
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("Connection closed.")
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")

if __name__ == "__main__":
    connect_to_postgres()