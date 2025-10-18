import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database."""
    try:
        # Connection parameters - replace with your actual database credentials
        connection = psycopg2.connect(
            user="your_username",
            password="your_password",
            host="your_host",  # e.g., 'localhost' or an IP address
            port="5432",       # default PostgreSQL port
            database="your_database_name"
        )

        cursor = connection.cursor()
        # Print PostgreSQL Connection Properties
        print(connection.get_dsn_parameters(), "\n")

        # Execute a simple query
        cursor.execute("SELECT version();")
        record = cursor.fetchone()
        print("You are connected to - ", record, "\n")

    except (Exception, psycopg2.OperationalError) as error:
        print("Error while connecting to PostgreSQL", error)

    finally:
        # Closing database connection.
        if connection:
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

if __name__ == "__main__":
    connect_to_db()