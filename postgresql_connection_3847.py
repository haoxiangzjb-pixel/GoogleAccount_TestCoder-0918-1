import psycopg2
from psycopg2 import sql

def connect_to_postgresql():
    """
    Connect to PostgreSQL database
    """
    try:
        # Database connection parameters - replace with your own
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your host
            'port': '5432'        # default PostgreSQL port
        }
        
        # Establish connection
        connection = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor
        cursor = connection.cursor()
        
        # Execute a simple query
        cursor.execute("SELECT version();")
        
        # Fetch result
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version}")
        
        # Close cursor and connection
        cursor.close()
        connection.close()
        print("Database connection closed.")
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")

if __name__ == "__main__":
    connect_to_postgresql()