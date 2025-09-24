import sqlite3

# Connect to SQLite database (or create it)
conn = sqlite3.connect("example.db")
cursor = conn.cursor()

# Create a sample table
cursor.execute("""
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER
)
""")

print("Table 'users' created successfully in 'example.db'.")

# Commit changes and close the connection
conn.commit()
conn.close()
