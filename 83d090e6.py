#!/usr/bin/env python3
"""
PostgreSQL connection script using psycopg2.
"""

import psycopg2
from psycopg2 import OperationalError


def connect_to_postgresql(
    host: str = "localhost",
    port: int = 5432,
    database: str = "postgres",
    user: str = "postgres",
    password: str = "password"
):
    """
    Establish a connection to a PostgreSQL database.

    Args:
        host: Database host address (default: localhost)
        port: Database port (default: 5432)
        database: Database name (default: postgres)
        user: Database user (default: postgres)
        password: Database password (default: password)

    Returns:
        psycopg2.connection: Connection object if successful, None otherwise
    """
    try:
        connection = psycopg2.connect(
            host=host,
            port=port,
            database=database,
            user=user,
            password=password
        )
        print("Successfully connected to PostgreSQL!")
        return connection
    except OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None


def main():
    # Example usage - update these values with your actual database credentials
    conn = connect_to_postgresql(
        host="localhost",
        port=5432,
        database="postgres",
        user="postgres",
        password="password"
    )

    if conn:
        # Create a cursor to execute SQL commands
        cursor = conn.cursor()

        # Example: Execute a simple query
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")

        # Close cursor and connection
        cursor.close()
        conn.close()
        print("Connection closed.")


if __name__ == "__main__":
    main()
