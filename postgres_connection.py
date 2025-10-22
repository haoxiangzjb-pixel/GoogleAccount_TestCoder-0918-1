import psycopg2
from psycopg2 import sql
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def connect_to_postgres(host, database, user, password, port=5432):
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
        # Establish the connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database")
        return connection
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    # Example connection parameters (you should replace these with your actual values)
    HOST = "localhost"  # or your database host
    DATABASE = "your_database_name"
    USER = "your_username"
    PASSWORD = "your_password"
    PORT = 5432  # default PostgreSQL port
    
    # Connect to the database
    conn = connect_to_postgres(HOST, DATABASE, USER, PASSWORD, PORT)
    
    if conn:
        # Create a cursor object
        cursor = conn.cursor()
        
        # Example: Execute a simple query
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        conn.close()
        print("PostgreSQL connection closed")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Saving script to: {random_filename}")
    
    # Save this script to a randomly named file
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    with open(f"/workspace/{random_filename}", 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script successfully saved to {random_filename}")

if __name__ == "__main__":
    main()