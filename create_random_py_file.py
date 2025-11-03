import os
import random
import string
import shutil

def generate_random_filename():
    """
    Generates a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Original script content
original_script = '''import mysql.connector
import random
import string

def execute_select_query():
    """
    Connects to MySQL and executes a SELECT query
    """
    try:
        # Establish connection to MySQL
        # Note: You'll need to update these connection parameters with your MySQL server details
        connection = mysql.connector.connect(
            host='localhost',  # Update with your MySQL host
            database='your_database',  # Update with your database name
            user='your_username',  # Update with your MySQL username
            password='your_password'  # Update with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Execute a SELECT query
            # Replace 'your_table' with the actual table name you want to query
            select_query = "SELECT * FROM your_table LIMIT 10;"
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            print("Records:")
            for row in records:
                print(row)
                
    except mysql.connector.Error as error:
        print(f"Error while connecting to MySQL: {error}")
        
    finally:
        # Close connections
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
    # Execute the SELECT query
    execute_select_query()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Random filename generated: {random_filename}")
'''

# Generate a random filename
random_filename = generate_random_filename()

# Write the content to the new randomly named file
with open(random_filename, 'w') as f:
    f.write(original_script)

print(f"Created randomly named Python file: {random_filename}")
print("The file contains a MySQL SELECT query script.")