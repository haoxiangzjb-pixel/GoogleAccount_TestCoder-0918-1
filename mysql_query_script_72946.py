import mysql.connector
import os

# Database configuration using environment variables for security
config = {
    'user': os.getenv('DB_USER', 'your_username'),
    'password': os.getenv('DB_PASSWORD', 'your_password'),
    'host': os.getenv('DB_HOST', 'localhost'),
    'database': os.getenv('DB_NAME', 'your_database'),
    'raise_on_warnings': True
}

def execute_select_query(query):
    """
    Connects to the MySQL database and executes a SELECT query.
    Fetches and prints all results.
    """
    try:
        # Establish connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()

        # Execute the query
        cursor.execute(query)

        # Fetch all results
        results = cursor.fetchall()

        # Print column names
        columns = cursor.column_names
        print("\t".join([str(col) for col in columns]))

        # Print results
        for row in results:
            print("\t".join([str(col) for col in row]))

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        # Close connections
        if cursor:
            cursor.close()
        if cnx:
            cnx.close()

if __name__ == "__main__":
    # Example SELECT query - replace with your actual query
    select_query = "SELECT * FROM your_table_name LIMIT 5;"
    execute_select_query(select_query)
