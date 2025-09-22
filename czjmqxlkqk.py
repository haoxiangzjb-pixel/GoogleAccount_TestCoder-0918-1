#!/usr/bin/env python3
"""
MySQL SELECT Query Executor
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error

def connect_to_mysql():
    """Establish a connection to the MySQL database."""
    try:
        connection = mysql.connector.connect(
            host='localhost',        # Replace with your host
            database='test_db',      # Replace with your database name
            user='root',             # Replace with your username
            password='password'      # Replace with your password
        )
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            return connection
            
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        print("Please ensure:")
        print("1. MySQL server is running")
        print("2. The database credentials in the script are correct")
        print("3. The database 'test_db' and table 'users' exist")
        return None

def execute_select_query(connection, query):
    """Execute a SELECT query and return the results."""
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        records = cursor.fetchall()
        
        print(f"Total number of rows: {cursor.rowcount}")
        print("Records:")
        
        for row in records:
            print(row)
            
        return records
        
    except Error as e:
        print(f"Error while executing query: {e}")
        return None
        
    finally:
        if 'cursor' in locals():
            cursor.close()

def main():
    """Main function to connect and query."""
    print("MySQL SELECT Query Executor")
    print("=" * 30)
    
    connection = connect_to_mysql()
    
    if connection:
        # Example SELECT query - modify as needed
        select_query = "SELECT * FROM users LIMIT 5"
        execute_select_query(connection, select_query)
        
        # Close the connection
        connection.close()
        print("MySQL connection is closed")

if __name__ == "__main__":
    main()