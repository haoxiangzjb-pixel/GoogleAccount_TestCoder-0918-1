import sqlite3
import random
import string

def generate_random_string(length=8):
    """Generate a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def create_database_and_table():
    # Generate a random database name
    db_name = f"{generate_random_string()}.db"
    
    # Connect to SQLite database (or create it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL UNIQUE,
            email TEXT NOT NULL UNIQUE,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Database '{db_name}' created with table 'users'")

if __name__ == "__main__":
    create_database_and_table()