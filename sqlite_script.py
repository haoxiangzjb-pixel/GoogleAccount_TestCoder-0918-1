import sqlite3
import random
import string

def create_random_table_name():
    """Generate a random table name"""
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

def create_sqlite_table():
    # Connect to SQLite database (or create it if it doesn't exist)
    conn = sqlite3.connect('example.db')
    cursor = conn.cursor()
    
    # Generate a random table name
    table_name = create_random_table_name()
    
    # Create a sample table with some columns
    create_table_query = f'''
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER,
        email TEXT UNIQUE,
        created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    '''
    
    cursor.execute(create_table_query)
    
    # Insert some sample data
    sample_data = [
        ('Alice Johnson', 30, 'alice@example.com'),
        ('Bob Smith', 25, 'bob@example.com'),
        ('Charlie Brown', 35, 'charlie@example.com')
    ]
    
    insert_query = f'INSERT INTO {table_name} (name, age, email) VALUES (?, ?, ?)'
    cursor.executemany(insert_query, sample_data)
    
    # Commit changes and close connection
    conn.commit()
    print(f"Table '{table_name}' created successfully with sample data.")
    print(f"Database file: example.db")
    
    conn.close()

if __name__ == "__main__":
    create_sqlite_table()