import mysql.connector
from mysql.connector import Error
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def execute_mysql_select():
    """
    Function to connect to MySQL and execute a SELECT query
    """
    connection = None
    try:
        # Database connection parameters - update these with your database details
        connection = mysql.connector.connect(
            host='localhost',          # Replace with your MySQL host
            database='your_database',  # Replace with your database name
            user='your_username',      # Replace with your MySQL username
            password='your_password'   # Replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Example SELECT query - modify this query as needed
            select_query = "SELECT * FROM your_table LIMIT 10;"  # Replace with your actual table and query
            
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Get column names
            column_names = [desc[0] for desc in cursor.description]
            
            print(f"Column names: {column_names}")
            print("Records:")
            for row in records:
                print(row)
                
            # Save results to a randomly named Python file
            random_filename = generate_random_filename()
            
            with open(random_filename, 'w') as f:
                f.write("# MySQL Query Results\n")
                f.write(f"# Query: {select_query}\n")
                f.write(f"# Columns: {column_names}\n\n")
                f.write("results = [\n")
                for row in records:
                    f.write(f"    {row},\n")
                f.write("]\n")
                
            print(f"Results saved to {random_filename}")
            
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    execute_mysql_select()