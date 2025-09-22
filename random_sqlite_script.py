import sqlite3
import uuid
import os

def create_table_with_uuid():
    # Generate a random name using UUID
    random_name = str(uuid.uuid4())[:8]
    db_filename = f"{random_name}.db"
    
    # Connect to the database (this creates it if it doesn't exist)
    conn = sqlite3.connect(db_filename)
    cursor = conn.cursor()
    
    # Create a sample table
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        category TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    ''')
    
    # Insert some sample data
    sample_products = [
        ("Laptop", 1200.00, "Electronics"),
        ("Coffee Mug", 15.99, "Kitchen"),
        ("Notebook", 5.50, "Stationery"),
        ("Headphones", 199.99, "Electronics")
    ]
    
    cursor.executemany(
        "INSERT OR IGNORE INTO products (name, price, category) VALUES (?, ?, ?)",
        sample_products
    )
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Database '{db_filename}' created with table 'products'")
    print("Sample data inserted:")
    for product in sample_products:
        print(f"  - {product[0]}: ${product[1]} ({product[2]})")

if __name__ == "__main__":
    create_table_with_uuid()