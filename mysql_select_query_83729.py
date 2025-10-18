import mysql.connector
from mysql.connector import Error
import random
import string

def generate_random_table_name():
    """Generate a random table name for demonstration purposes."""
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

def execute_mysql_select():
    """
    Connects to MySQL and executes a SELECT query.
    Note: You'll need to update the connection parameters with your actual MySQL server details.
    """
    connection = None
    cursor = None
    
    try:
        # MySQL connection parameters - update these with your server details
        connection_config = {
            'host': 'localhost',  # Change to your MySQL server host
            'database': 'your_database',  # Change to your database name
            'user': 'your_username',  # Change to your MySQL username
            'password': 'your_password'  # Change to your MySQL password
        }
        
        print("Attempting to connect to MySQL database...")
        connection = mysql.connector.connect(**connection_config)
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            cursor = connection.cursor()
            
            # Example SELECT query - replace with your actual table and column names
            random_table_name = generate_random_table_name()
            select_query = f"SELECT * FROM {random_table_name} LIMIT 10;"
            
            print(f"Executing query: {select_query}")
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Get column names
            column_names = [desc[0] for desc in cursor.description]
            print(f"Column names: {column_names}")
            
            # Print the records
            print(f"Total number of records: {len(records)}")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed")

def execute_predefined_select():
    """
    Executes a SELECT query on a predefined table.
    This is an alternative function that uses a more common table structure.
    """
    connection = None
    cursor = None
    
    try:
        # MySQL connection parameters - update these with your actual MySQL server details
        connection_config = {
            'host': 'localhost',  # Change to your MySQL server host
            'database': 'your_database',  # Change to your database name
            'user': 'your_username',  # Change to your MySQL username
            'password': 'your_password'  # Change to your MySQL password
        }
        
        print("Attempting to connect to MySQL database...")
        connection = mysql.connector.connect(**connection_config)
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            cursor = connection.cursor()
            
            # Example SELECT query - customize this based on your table structure
            select_query = "SELECT * FROM users LIMIT 10;"  # Change 'users' to your table name
            
            print(f"Executing query: {select_query}")
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Get column names
            column_names = [desc[0] for desc in cursor.description]
            print(f"Column names: {column_names}")
            
            # Print the records
            print(f"Total number of records: {len(records)}")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    print("MySQL SELECT Query Script")
    print("=" * 30)
    
    # Execute the predefined select function
    execute_predefined_select()