#!/usr/bin/env python3
"""
PostgreSQL connection script using psycopg2
"""

import psycopg2
from psycopg2 import Error


def connect_to_postgresql(host="localhost", port=5432, database="postgres", user="postgres", password=""):
    """
    Establish a connection to a PostgreSQL database.
    
    Args:
        host: Database host address
        port: Database port
        database: Database name
        user: Database user
        password: Database password
    
    Returns:
        Connection object if successful, None otherwise
    """
    connection = None
    try:
        connection = psycopg2.connect(
            host=host,
            port=port,
            database=database,
            user=user,
            password=password
        )
        print("Successfully connected to PostgreSQL database")
        return connection
    except Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None


def main():
    # Update these parameters with your actual database credentials
    host = "localhost"
    port = 5432
    database = "postgres"
    user = "postgres"
    password = "your_password_here"
    
    connection = connect_to_postgresql(
        host=host,
        port=port,
        database=database,
        user=user,
        password=password
    )
    
    if connection:
        try:
            cursor = connection.cursor()
            cursor.execute("SELECT version();")
            db_version = cursor.fetchone()
            print(f"PostgreSQL version: {db_version[0]}")
            cursor.close()
        except Error as e:
            print(f"Error executing query: {e}")
        finally:
            if connection:
                connection.close()
                print("Database connection closed")


if __name__ == "__main__":
    main()
