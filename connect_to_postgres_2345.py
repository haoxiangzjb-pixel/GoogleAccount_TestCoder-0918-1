import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database."""
    try:
        # Connection parameters - replace with your actual database credentials
        connection = psycopg2.connect(
            host="localhost",      # or your database server address
            database="your_db_name",
            user="your_username",
            password="your_password",
            port=5432              # default PostgreSQL port
        )
        print("Connected to PostgreSQL database!")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL database: {e}")
        return None

def main():
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor()

        # Example: Execute a simple query
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"PostgreSQL Database Version: {db_version[0]}")

        # Always close the cursor and connection
        cursor.close()
        conn.close()
        print("Connection closed.")

if __name__ == "__main__":
    main()