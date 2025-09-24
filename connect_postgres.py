import psycopg2
from psycopg2 import sql

def connect_to_db():
  """Connects to a PostgreSQL database and prints a success message."""
  try:
    # Replace these connection details with your actual database credentials
    connection = psycopg2.connect(
        host="localhost",      # e.g., 'localhost', '127.0.0.1', or a remote address
        database="your_db_name",
        user="your_username",
        password="your_password",
        port=5432              # Default PostgreSQL port
    )

    cursor = connection.cursor()
    print("Connected to PostgreSQL database successfully!")
    # Example query to test the connection
    cursor.execute("SELECT version();")
    db_version = cursor.fetchone()
    print(f"PostgreSQL version: {db_version[0]}")

    cursor.close()
    connection.close()
    print("PostgreSQL connection closed.")

  except (Exception, psycopg2.Error) as error:
    print(f"Error while connecting to PostgreSQL: {error}")

if __name__ == "__main__":
    connect_to_db()