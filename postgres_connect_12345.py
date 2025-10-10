import psycopg2
from psycopg2 import sql

# Database connection parameters
DB_PARAMS = {
    'dbname': 'your_database_name',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or the host address of your database
    'port': '5432'        # default PostgreSQL port
}

def connect_to_db():
    """Establishes a connection to the PostgreSQL database."""
    try:
        connection = psycopg2.connect(**DB_PARAMS)
        print("Successfully connected to the database!")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to database: {e}")
        return None

def main():
    conn = connect_to_db()
    if conn:
        # Example: Create a cursor and execute a simple query
        cursor = conn.cursor()
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        conn.close()
        print("Database connection closed.")

if __name__ == "__main__":
    main()