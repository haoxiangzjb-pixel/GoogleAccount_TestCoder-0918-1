import sqlite3
import random
import string

def create_sqlite_table():
    """Creates a SQLite database and table with sample data."""
    
    # Generate a random table name
    table_name = 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    
    # Connect to SQLite database (creates it if it doesn't exist)
    conn = sqlite3.connect('sample_database.db')
    cursor = conn.cursor()
    
    # Create a sample table with id, name, and email columns
    create_table_query = f"""
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    """
    
    cursor.execute(create_table_query)
    
    # Insert some sample data
    sample_data = [
        ('John Doe', 'john@example.com'),
        ('Jane Smith', 'jane@example.com'),
        ('Bob Johnson', 'bob@example.com')
    ]
    
    insert_query = f"INSERT OR IGNORE INTO {table_name} (name, email) VALUES (?, ?)"
    cursor.executemany(insert_query, sample_data)
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Table '{table_name}' created successfully in 'sample_database.db'")
    print(f"Sample data inserted into the table.")

if __name__ == "__main__":
    create_sqlite_table()