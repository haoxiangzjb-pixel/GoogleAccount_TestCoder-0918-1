import random
import string
from pymongo import MongoClient

def generate_random_name(length=8):
    """Generate a random string for the file name"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    """Insert a sample document into MongoDB"""
    # Connect to MongoDB (assuming local instance)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Access database and collection
    db = client['test_database']
    collection = db['test_collection']
    
    # Create a sample document
    document = {
        "name": "Sample Document",
        "value": random.randint(1, 100),
        "tags": ["sample", "document", "pymongo"]
    }
    
    # Insert the document
    result = collection.insert_one(document)
    print(f"Inserted document with ID: {result.inserted_id}")
    
    # Retrieve and display the inserted document
    inserted_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {inserted_doc}")
    
    # Close the connection
    client.close()

if __name__ == "__main__":
    insert_document()