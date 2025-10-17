import random
import string
from pymongo import MongoClient

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Create a MongoDB client (connects to localhost by default)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Create/access a database
    db = client['sample_database']
    
    # Create/access a collection
    collection = db['sample_collection']
    
    # Create a sample document to insert
    document = {
        "name": "John Doe",
        "age": 30,
        "email": "john.doe@example.com",
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    }
    
    # Insert the document into the collection
    result = collection.insert_one(document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify the document was inserted by finding it
    inserted_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Inserted document: {inserted_doc}")
    
    # Close the connection
    client.close()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    with open(random_filename, 'w') as f:
        f.write('''import random
import string
from pymongo import MongoClient

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Create a MongoDB client (connects to localhost by default)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Create/access a database
    db = client['sample_database']
    
    # Create/access a collection
    collection = db['sample_collection']
    
    # Create a sample document to insert
    document = {
        "name": "John Doe",
        "age": 30,
        "email": "john.doe@example.com",
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    }
    
    # Insert the document into the collection
    result = collection.insert_one(document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify the document was inserted by finding it
    inserted_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Inserted document: {inserted_doc}")
    
    # Close the connection
    client.close()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(# This would be the content of this script)
    
    print(f"Script saved to: {random_filename}")

if __name__ == "__main__":
    main()
''')
    
    print(f"Script saved to: {random_filename}")

if __name__ == "__main__":
    main()