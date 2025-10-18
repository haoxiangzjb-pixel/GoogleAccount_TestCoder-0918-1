import mysql.connector
import random
import string

def execute_select_query():
    """
    Connects to MySQL and executes a SELECT query.
    This is a template that can be customized with actual connection details.
    """
    try:
        # Connection parameters - these would need to be updated with actual values
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
            
        print(f"Query executed successfully. Retrieved {len(results)} rows.")
        
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        
    finally:
        # Close connections
        if cursor:
            cursor.close()
        if cnx:
            cnx.close()

# Run the function
if __name__ == "__main__":
    execute_select_query()