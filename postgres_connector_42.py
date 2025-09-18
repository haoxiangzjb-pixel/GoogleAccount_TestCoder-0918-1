#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Establish a connection to the PostgreSQL database."""
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
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a simple query
        cur.execute("SELECT version();")
        
        # Fetch result
        db_version = cur.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cur.close()
        conn.close()
        print("Database connection closed.")
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL database: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def create_sample_table():
    """Create a sample table in the database."""
    try:
        # Database connection parameters
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',
            'port': '5432'
        }
        
        # Establishing the connection
        conn = psycopg2.connect(**conn_params)
        cur = conn.cursor()
        
        # Create table query
        create_table_query = """
        CREATE TABLE IF NOT EXISTS employees (
            id SERIAL PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            department VARCHAR(50),
            salary DECIMAL(10, 2)
        );
        """
        
        # Execute the query
        cur.execute(create_table_query)
        conn.commit()
        print("Table 'employees' created successfully!")
        
        # Close the cursor and connection
        cur.close()
        conn.close()
        
    except psycopg2.Error as e:
        print(f"Error creating table: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Connect to the database
    connect_to_db()
    
    # Uncomment the following line to create a sample table
    # create_sample_table()