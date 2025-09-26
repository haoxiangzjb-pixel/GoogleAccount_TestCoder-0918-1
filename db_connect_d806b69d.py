import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database server."""
    conn = None
    try:
        # Connect to the PostgreSQL server
        conn = psycopg2.connect(
            host="localhost",      # or your server's address
            database="your_db",    # your database name
            user="your_user",      # your username
            password="your_password"  # your password
        )
        print("Connected to the database successfully!")
        return conn
    except psycopg2.OperationalError as e:
        print(f"Error connecting to database: {e}")
        return None

if __name__ == '__main__':
    connection = connect_to_db()
    if connection:
        print("Connection object created.")
        # Always close the connection when done
        connection.close()
        print("Connection closed.")
    else:
        print("Failed to create connection object.")