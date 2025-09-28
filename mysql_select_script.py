import mysql.connector
from mysql.connector import Error

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Replace the connection details and query with your own.
    """
    connection = None
    try:
        # Replace these connection details with your actual database information
        connection = mysql.connector.connect(
            host='localhost',  # e.g., 'localhost' or an IP address
            database='your_database_name',
            user='your_username',
            password='your_password'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Replace this query with your desired SELECT statement
            query = "SELECT * FROM your_table_name LIMIT 5;"
            cursor.execute(query)

            # Fetch all results
            records = cursor.fetchall()

            print("Number of rows fetched:", cursor.rowcount)
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
    execute_select_query()
