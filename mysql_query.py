import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    connection = None
    try:
        # Replace these with your actual database credentials
        connection = mysql.connector.connect(
            host='localhost',          # Your MySQL server host
            database='your_database',  # Your database name
            user='your_username',      # Your MySQL username
            password='your_password'   # Your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - modify this as needed
            select_query = "SELECT * FROM your_table LIMIT 10;"
            cursor.execute(select_query)

            records = cursor.fetchall()
            print("Records from the table:")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    execute_select_query()
