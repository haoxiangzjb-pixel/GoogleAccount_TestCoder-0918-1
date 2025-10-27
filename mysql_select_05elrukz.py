#!/usr/bin/env python3
"""
MySQL SELECT Query Script
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error
import os


def connect_and_query():
    """
    Connect to MySQL database and execute a SELECT query
    """
    connection = None
    cursor = None
    
    try:
        # Database connection parameters
        # These can be modified or read from environment variables
        host = os.getenv('DB_HOST', 'localhost')
        database = os.getenv('DB_NAME', 'your_database')
        user = os.getenv('DB_USER', 'your_username')
        password = os.getenv('DB_PASSWORD', 'your_password')
        
        # Create connection
        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )
        
        if connection.is_connected():
            print(f"Successfully connected to MySQL database: {database}")
            
            # Create cursor
            cursor = connection.cursor()
            
            # Execute SELECT query
            # Modify this query as needed for your use case
            select_query = "SELECT * FROM your_table LIMIT 10;"
            cursor.execute(select_query)
            
            # Fetch results
            records = cursor.fetchall()
            
            # Print column names
            column_names = [i[0] for i in cursor.description]
            print("Column names:", column_names)
            
            # Print results
            print(f"Total number of rows: {cursor.rowcount}")
            print("Data from table:")
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
            print("MySQL connection is closed")


if __name__ == "__main__":
    print("Starting MySQL SELECT query execution...")
    connect_and_query()