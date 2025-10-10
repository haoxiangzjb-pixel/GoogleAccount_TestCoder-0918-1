import psycopg2
from psycopg2 import sql

# Connection parameters
conn_params = {
    'host': 'localhost',  # or the IP address of your PostgreSQL server
    'database': 'your_database_name',
    'user': 'your_username',
    'password': 'your_password',
    'port': '5432'        # default PostgreSQL port
}

def connect_to_postgres():
    """
    Connects to the PostgreSQL database using the provided parameters.
    """
    try:
        # Establish the connection
        connection = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database!")
        return connection

    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

if __name__ == "__main__":
    conn = connect_to_postgres()
    if conn:
        # Example: Create a cursor and execute a simple query
        cursor = conn.cursor()
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL Database Version: {db_version[0]}")

        # Close the cursor and connection
        cursor.close()
        conn.close()
        print("Connection closed.")
    else:
        print("Failed to establish a connection.")