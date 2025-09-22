#!/usr/bin/env python3
"""
MySQL SELECT Query Executor
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error

def connect_and_query():
    """Connect to MySQL database and execute a SELECT query"""
    connection = None
    try:
        # Database connection parameters
        connection = mysql.connector.connect(
            host='localhost',
            database='test_db',
            user='root',
            password='password'
        )

        if connection.is_connected():
            db_info = connection.get_server_info()
            print(f"Connected to MySQL Server version {db_info}")
            
            # Create cursor
            cursor = connection.cursor()
            
            # Execute SELECT query
            query = "SELECT * FROM users LIMIT 5"
            cursor.execute(query)
            
            # Fetch results
            records = cursor.fetchall()
            print(f"Total number of rows: {cursor.rowcount}")
            
            # Display results
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    connect_and_query()