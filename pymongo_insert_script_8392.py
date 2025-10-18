import pymongo
import random
import string

def generate_random_string(length=10):
    """Generate a random string of specified length."""
    letters = string.ascii_lowercase + string.digits
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    """Connect to MongoDB and insert a document."""
    try:
        # Create a connection to MongoDB (assumes MongoDB is running locally)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create/access a database
        db = client["sample_database"]
        
        # Create/access a collection
        collection = db["sample_collection"]
        
        # Create a document to insert
        sample_document = {
            "name": f"Sample Document {generate_random_string(5)}",
            "value": random.randint(1, 100),
            "description": f"This is a randomly generated document with ID: {generate_random_string(8)}",
            "timestamp": "2025-10-19",
            "status": "active"
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Inserted document: {sample_document}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document()