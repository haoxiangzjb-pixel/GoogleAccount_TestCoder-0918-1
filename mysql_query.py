import mysql.connector
from mysql.connector import Error
import uuid

# Generate a random filename
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

try:
    # Establish the connection
    connection = mysql.connector.connect(
        host='localhost',  # Replace with your host
        database='your_database',  # Replace with your database name
        user='your_username',  # Replace with your username
        password='your_password'  # Replace with your password
    )

    if connection.is_connected():
        cursor = connection.cursor()
        # Example SELECT query
        query = "SELECT * FROM your_table LIMIT 5;"  # Replace with your query
        cursor.execute(query)

        # Fetch all results
        records = cursor.fetchall()

        # Write results to the randomly named file
        with open(random_filename, 'w') as f:
            for row in records:
                f.write(str(row) + '\n')

        print(f"Query results saved to {random_filename}")

except Error as e:
    print(f"Error: {e}")
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")