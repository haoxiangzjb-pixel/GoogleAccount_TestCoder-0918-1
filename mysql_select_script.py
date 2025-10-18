import mysql.connector
import random
import string

def execute_select_query():
    """
    Executes a SELECT query on MySQL database
    """
    try:
        # Database connection parameters - these should be configured based on your setup
        config = {
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your MySQL server address
            'database': 'your_database',
            'raise_on_warnings': True
        }
        
        # Establish connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()
        
        # Example SELECT query - modify as needed
        query = "SELECT * FROM your_table LIMIT 10;"
        cursor.execute(query)
        
        # Fetch results
        results = cursor.fetchall()
        
        # Print results
        for row in results:
            print(row)
        
        # Get column names
        column_names = [desc[0] for desc in cursor.description]
        print(f"Columns: {column_names}")
        
        print(f"Total rows returned: {len(results)}")
        
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