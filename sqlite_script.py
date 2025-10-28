import sqlite3
import random
import string

def create_sample_table():
    # Generate a random database name
    db_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.db'
    
    # Connect to SQLite database (creates it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    table_name = 'users'
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
        ('Alice Johnson', 'alice@example.com', 28),
        ('Bob Smith', 'bob@example.com', 35),
        ('Charlie Brown', 'charlie@example.com', 22)
    ]
    
    cursor.executemany(f'INSERT INTO {table_name} (name, email, age) VALUES (?, ?, ?)', sample_data)
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Database '{db_name}' created successfully with '{table_name}' table.")
    print(f"Table contains {len(sample_data)} sample records.")

if __name__ == "__main__":
    create_sample_table()