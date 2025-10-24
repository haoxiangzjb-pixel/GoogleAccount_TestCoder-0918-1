import mysql.connector
from mysql.connector import Error
import random
import string

def execute_select_query():
    """
    Executes a SELECT query on MySQL database
    """
    try:
        # Database connection parameters - modify these according to your setup
        connection = mysql.connector.connect(
            host='localhost',  # Change this to your MySQL host
            database='your_database',  # Change this to your database name
            user='your_username',  # Change this to your MySQL username
            password='your_password'  # Change this to your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Example SELECT query - modify this according to your table
            select_query = "SELECT * FROM your_table LIMIT 10;"  # Change this to your actual query
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            print("Records:")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Closing database connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

def generate_random_filename():
    """
    Generates a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    execute_select_query()