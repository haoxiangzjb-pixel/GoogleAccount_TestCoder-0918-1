#!/usr/bin/env python3
"""
PostgreSQL connection script using psycopg2
"""

import psycopg2
from psycopg2 import sql
import os


def connect_to_postgresql(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    
    Args:
        host (str): Database host
        database (str): Database name
        user (str): Username
        password (str): Password
        port (int): Port number (default 5432)
    
    Returns:
        connection: psycopg2 connection object
    """
    try:
        # Establish connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database!")
        return connection
    
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return None


def execute_query(connection, query):
    """
    Execute a SQL query on the given connection
    
    Args:
        connection: psycopg2 connection object
        query (str): SQL query to execute
    
    Returns:
        list: Query results
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        
        if query.strip().upper().startswith("SELECT"):
            results = cursor.fetchall()
            return results
        else:
            # For non-SELECT queries
            connection.commit()
            print(f"Query executed successfully. Rows affected: {cursor.rowcount}")
            return None
    
    except psycopg2.Error as error:
        print(f"Error executing query: {error}")
        connection.rollback()
        return None


def main():
    """
    Main function to demonstrate PostgreSQL connection
    """
    # Database connection parameters
    # You can set these as environment variables for security
    db_config = {
        'host': os.getenv('DB_HOST', 'localhost'),
        'database': os.getenv('DB_NAME', 'postgres'),
        'user': os.getenv('DB_USER', 'postgres'),
        'password': os.getenv('DB_PASSWORD', 'password'),
        'port': int(os.getenv('DB_PORT', 5432))
    }
    
    print("Connecting to PostgreSQL database...")
    
    # Connect to PostgreSQL
    conn = connect_to_postgresql(**db_config)
    
    if conn:
        # Example: Execute a simple query
        results = execute_query(conn, "SELECT version();")
        if results:
            print("Database version:", results[0][0])
        
        # Close the connection
        conn.close()
        print("Connection closed.")


if __name__ == "__main__":
    main()