import mysql.connector
from mysql.connector import Error
import os

def execute_select_query():
    """Connects to MySQL and executes a SELECT query."""
    try:
        # Establish the connection
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST', 'localhost'),  # Use environment variable or default
            database=os.getenv('DB_NAME', 'your_database'), # Use environment variable or default
            user=os.getenv('DB_USER', 'your_username'), # Use environment variable or default
            password=os.getenv('DB_PASS', 'your_password') # Use environment variable or default
        )

        if connection.is_connected():
            print("Successfully connected to MySQL database")
            cursor = connection.cursor()
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table_name LIMIT 10;"
            cursor.execute(select_query)
            records = cursor.fetchall()

            print("Total number of rows in the table: ", cursor.rowcount)
            print("\nPrinting each row's column values")
            for row in records:
                print("Column 1 Value: ", row[0]) # Modify index based on your table schema
                print("Column 2 Value: ", row[1]) # Modify index based on your table schema
                # Add more print statements as needed for additional columns

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    execute_select_query()
