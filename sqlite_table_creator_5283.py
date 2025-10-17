import sqlite3
import random
import string

def create_sqlite_table():
    """Creates a SQLite database and a sample table."""
    # Generate a random database name
    db_name = 'sample_db_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.db'
    
    # Connect to SQLite database (it will be created if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    table_name = 'users_' + ''.join(random.choices(string.ascii_lowercase, k=5))
    cursor.execute(f'''
        CREATE TABLE {table_name} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            age INTEGER,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    
    # Insert some sample data
    sample_data = [
        ('John Doe', 'john@example.com', 30),
        ('Jane Smith', 'jane@example.com', 25),
        ('Bob Johnson', 'bob@example.com', 35)
    ]
    
    cursor.executemany(f'INSERT INTO {table_name} (name, email, age) VALUES (?, ?, ?)', sample_data)
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Database '{db_name}' created successfully!")
    print(f"Table '{table_name}' created with sample data.")
    print(f"Columns: id, name, email, age, created_at")

if __name__ == "__main__":
    create_sqlite_table()