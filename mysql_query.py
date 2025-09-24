import mysql.connector
import uuid

# This script connects to a MySQL database, executes a SELECT query,
# fetches the results, and prints them.

# Configuration: Update these variables with your database details
DB_HOST = 'localhost'
DB_USER = 'your_username'
DB_PASSWORD = 'your_password'
DB_NAME = 'your_database'

def execute_select_query():
    """
    Connects to the MySQL database, executes a SELECT query, and prints the results.
    """
    try:
        # Establish the connection
        connection = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME
        )

        if connection.is_connected():
            print("Successfully connected to the database")
            cursor = connection.cursor()

            # Example SELECT query - modify this query as needed
            query = "SELECT * FROM your_table LIMIT 5;"
            cursor.execute(query)

            # Fetch all results
            records = cursor.fetchall()
            print(f"Total number of records: {cursor.rowcount}")
            print("Fetching each row:")
            for row in records:
                print(row)

    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    # Generate a random file name using uuid
    random_file_name = f"query_output_{uuid.uuid4().hex}.txt"
    print(f"This script would normally save results to: {random_file_name}")
    print("-" * 20)
    execute_select_query()