import mysql.connector
import random
import string

def execute_mysql_select():
    """
    Executes a SELECT query on MySQL database
    """
    try:
        # Establish connection to MySQL database
        # Replace these values with your actual database credentials
        connection = mysql.connector.connect(
            host='localhost',          # Replace with your MySQL host
            database='your_database',  # Replace with your database name
            user='your_username',      # Replace with your MySQL username
            password='your_password'   # Replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Example SELECT query - modify as needed
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
        # Close database connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"mysql_script_{random_string}.py"

if __name__ == "__main__":
    # Execute the SELECT query
    execute_mysql_select()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Random filename generated: {random_filename}")