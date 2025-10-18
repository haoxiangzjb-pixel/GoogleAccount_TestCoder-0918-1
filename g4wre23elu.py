import mysql.connector
import random
import string

def execute_select_query():
    """
    Connects to MySQL and executes a SELECT query.
    This is a template that can be customized for specific use cases.
    """
    try:
        # Database connection parameters - customize these for your setup
        config = {
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your MySQL server host
            'database': 'your_database',
            'raise_on_warnings': True
        }
        
        # Establish connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()
        
        # Example SELECT query - modify this as needed
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

def generate_random_filename():
    """Generate a random Python filename"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    # Execute the SELECT query
    execute_select_query()
    
    # Generate a random filename for this script
    random_filename = generate_random_filename()
    print(f"This script could be saved with the random name: {random_filename}")