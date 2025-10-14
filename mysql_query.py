import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database, executes a SELECT query,
    and saves the results to a file with a random name.
    """
    connection = None
    try:
        # --- Configuration ---
        # Replace these with your actual database credentials
        host = 'localhost'
        database = 'your_database_name'
        user = 'your_username'
        password = 'your_password'
        select_query = "SELECT * FROM your_table_name LIMIT 5;" # Modify as needed
        # --- End Configuration ---

        print(f"Attempting to connect to {host}...")
        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            print(f"Connected. Executing query: {select_query}")
            cursor.execute(select_query)
            records = cursor.fetchall()

            # Generate a random filename
            random_filename = f"query_results_{uuid.uuid4().hex}.txt"
            print(f"Saving results to {random_filename}")

            with open(random_filename, 'w') as f:
                for row in records:
                    f.write(str(row) + '\n')

            print(f"Query executed successfully. Results saved to {random_filename}.")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    execute_select_query()
