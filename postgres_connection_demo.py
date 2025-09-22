#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Establishes a connection to the PostgreSQL database."""
    try:
        # Database connection parameters - update these as needed
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',
            'port': '5432'
        }
        
        # Attempt to connect to the database
        conn = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a simple query
        cur.execute("SELECT version();")
        
        # Fetch and print the result
        db_version = cur.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor and connection
        cur.close()
        conn.close()
        print("Database connection closed.")
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")

if __name__ == "__main__":
    connect_to_db()