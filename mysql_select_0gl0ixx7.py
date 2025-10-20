#!/usr/bin/env python3
"""
MySQL SELECT Query Script
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error
import os


def connect_and_select():
    """
    Connect to MySQL database and execute a SELECT query
    """
    connection = None
    cursor = None
    
    try:
        # Database connection parameters
        # You can modify these values according to your MySQL setup
        host = os.getenv('DB_HOST', 'localhost')
        database = os.getenv('DB_NAME', 'your_database_name')
        user = os.getenv('DB_USER', 'your_username')
        password = os.getenv('DB_PASSWORD', 'your_password')
        
        # Establish database connection
        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )
        
        if connection.is_connected():
            print(f"Successfully connected to MySQL database: {database}")
            
            # Create cursor object
            cursor = connection.cursor()
            
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table_name LIMIT 10;"
            
            # Execute the SELECT query
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Get column names
            column_names = [desc[0] for desc in cursor.description]
            print(f"Column names: {column_names}")
            
            print(f"Total number of records: {len(records)}")
            print("\nRecords:")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("\nMySQL connection is closed")


if __name__ == "__main__":
    connect_and_select()