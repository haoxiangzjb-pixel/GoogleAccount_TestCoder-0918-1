import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    """
    connection = None
    try:
        # Replace these connection parameters with your actual database details
        connection = mysql.connector.connect(
            host='localhost',          # e.g., 'localhost' or an IP address
            database='your_database',  # your database name
            user='your_username',      # your MySQL username
            password='your_password'   # your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table LIMIT 5;"
            cursor.execute(select_query)
            records = cursor.fetchall()

            print(f"Query executed: {select_query}")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    # Generate a random filename using uuid
    random_filename = f"query_script_{uuid.uuid4().hex}.py"
    print(f"This script is saved as: mysql_query.py")
    print(f"A new random filename generated is: {random_filename}")
    print("\nExecuting the SELECT query now...")
    execute_select_query()
