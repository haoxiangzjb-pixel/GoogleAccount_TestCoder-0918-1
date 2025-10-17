import random
import string
from pymongo import MongoClient

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Generate a random filename first
    random_filename = generate_random_filename()
    
    # Save a simple version of this script to the randomly named file
    script_content = '''# PyMongo Insert Script
import random
import string
from pymongo import MongoClient

def main():
    try:
        # Create a MongoDB client
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
        
        # Test the connection
        client.admin.command('ping')
        print("Connected to MongoDB successfully!")
        
        # Create/access a database
        db = client['sample_database']
        
        # Create/access a collection
        collection = db['sample_collection']
        
        # Create a sample document to insert
        document = {
            "name": "Jane Smith",
            "age": 25,
            "email": "jane.smith@example.com",
            "city": "San Francisco",
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8)),
            "timestamp": "2023-01-01T00:00:00Z"
        }
        
        # Insert the document into the collection
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    
    try:
        # Create a MongoDB client (connects to localhost by default)
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
        
        # Test the connection
        client.admin.command('ping')
        print("Connected to MongoDB successfully!")
        
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
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8)),
            "timestamp": "2023-01-01T00:00:00Z"
        }
        
        # Insert the document into the collection
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Verify the document was inserted by finding it
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Inserted document: {inserted_doc}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")
        print("Note: Make sure MongoDB is running on localhost:27017")

if __name__ == "__main__":
    main()