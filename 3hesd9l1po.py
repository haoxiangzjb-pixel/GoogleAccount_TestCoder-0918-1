# PyMongo Insert Script
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
