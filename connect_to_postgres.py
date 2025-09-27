import psycopg2
from psycopg2 import sql

def connect_to_db():
  """Connects to a PostgreSQL database."""
  try:
    # Replace these with your actual database credentials
    connection = psycopg2.connect(
        user="your_username",
        password="your_password",
        host="your_host",      # e.g., 'localhost' or an IP address
        port="5432",           # Default PostgreSQL port
        database="your_database"
    )

    cursor = connection.cursor()
    # Print PostgreSQL version
    cursor.execute('SELECT version();')
    db_version = cursor.fetchone()
    print(f"Successfully connected to PostgreSQL database. Version: {db_version[0]}")

    # Example: Execute a simple query
    # cursor.execute(sql.SQL("SELECT * FROM your_table LIMIT %s"), (5,))
    # records = cursor.fetchall()
    # for row in records:
    #   print(row)

    return connection, cursor

  except (Exception, psycopg2.Error) as error:
    print(f"Error while connecting to PostgreSQL: {error}")
    return None, None

def main():
  conn, cur = connect_to_db()
  if conn:
    # Perform database operations here using conn and cur
    cur.close()
    conn.close()
    print("PostgreSQL connection is closed.")

if __name__ == "__main__":
    main()