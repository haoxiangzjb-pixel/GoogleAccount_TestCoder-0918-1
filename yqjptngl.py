import psycopg2

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2.
    
    Returns:
        connection: PostgreSQL connection object
    """
    try:
        # Connection parameters - modify these as needed
        connection = psycopg2.connect(
            host="localhost",
            database="your_database",
            user="your_username",
            password="your_password",
            port="5432"
        )
        
        print("Successfully connected to PostgreSQL")
        return connection
    
    except Exception as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

if __name__ == "__main__":
    conn = connect_to_postgres()
    if conn:
        # Example usage
        cursor = conn.cursor()
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version}")
        cursor.close()
        conn.close()
        print("Connection closed")