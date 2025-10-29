import os
import random
import string

# MySQL query script content
mysql_script_content = '''import mysql.connector

def execute_mysql_select_query():
    """
    Connects to MySQL and executes a SELECT query.
    Note: You'll need to install mysql-connector-python package first.
    """
    try:
        # Establish connection to MySQL database
        # Replace these values with your actual database credentials
        connection = mysql.connector.connect(
            host='localhost',          # Your MySQL server host
            database='your_database',  # Your database name
            user='your_username',      # Your MySQL username
            password='your_password'   # Your MySQL password
        )
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            
            # Create cursor object
            cursor = connection.cursor()
            
            # Execute SELECT query (replace with your actual query)
            select_query = "SELECT * FROM your_table LIMIT 10;"  # Example query
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Print the records
            print("Total number of records: ", cursor.rowcount)
            for row in records:
                print(row)
                
    except mysql.connector.Error as error:
        print(f"Error while connecting to MySQL: {error}")
        
    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    execute_mysql_select_query()
'''

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=12))
    return f"{random_name}.py"

# Generate random filename
random_filename = generate_random_filename()
random_filepath = os.path.join('/workspace', random_filename)

# Write the MySQL script to the randomly named file
with open(random_filepath, 'w') as file:
    file.write(mysql_script_content)

print(f"MySQL query script created successfully: {random_filepath}")