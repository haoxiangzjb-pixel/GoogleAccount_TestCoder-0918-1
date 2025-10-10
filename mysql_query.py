import mysql.connector
import uuid

def execute_select_query():
    # Replace these with your actual database credentials
    config = {
        'user': 'your_username',
        'password': 'your_password',
        'host': 'localhost',  # or your host address
        'database': 'your_database_name',
        'raise_on_warnings': True
    }

    try:
        # Establish the connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()

        # Define your SELECT query here
        query = "SELECT * FROM your_table_name LIMIT 5;"  # Example query
        cursor.execute(query)

        # Fetch all results
        results = cursor.fetchall()

        # Optionally, get column names
        column_names = [desc[0] for desc in cursor.description]
        print("Column names:", column_names)
        print("Results:")
        for row in results:
            print(row)

    except mysql.connector.Error as err:
        print(f"Error: {err}")

    finally:
        # Close connections
        if cursor:
            cursor.close()
        if cnx:
            cnx.close()

if __name__ == "__main__":
    execute_select_query()