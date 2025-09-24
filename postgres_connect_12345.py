import psycopg2
from psycopg2 import sql

# Database connection parameters
DB_PARAMS = {
    'host': 'localhost',      # Replace with your host
    'database': 'mydb',       # Replace with your database name
    'user': 'myuser',         # Replace with your username
    'password': 'mypassword', # Replace with your password
    'port': '5432'            # Replace with your port if different
}

def connect_to_postgres():
    """Connects to the PostgreSQL database using psycopg2."""
    try:
        print("Attempting to connect to PostgreSQL...")
        connection = psycopg2.connect(**DB_PARAMS)
        print("Connected to PostgreSQL successfully!")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    conn = connect_to_postgres()
    if conn:
        # Example: Print connection info
        print(f"Connection object: {conn}")
        # Don't forget to close the connection
        conn.close()
        print("Connection closed.")

if __name__ == "__main__":
    main()