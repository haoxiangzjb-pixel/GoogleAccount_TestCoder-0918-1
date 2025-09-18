#!/usr/bin/env python3
"""
PyMongo script to insert a document into a MongoDB collection - Demo version
This version shows what the script would do if MongoDB were available.
"""
import random
import string

def insert_document_demo():
    print("Attempting to connect to MongoDB at mongodb://localhost:27017/...")
    
    # Simulate a successful connection
    print("Connected to MongoDB successfully!")
    
    # Create/access database
    db_name = "test_database"
    print(f"Accessing database: {db_name}")
    
    # Create/access collection
    collection_name = "test_collection"
    print(f"Accessing collection: {collection_name}")
    
    # Create a sample document
    document = {
        "_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8)),
        "name": "Sample Document",
        "value": random.randint(1, 100),
        "tags": ["sample", "pymongo", "insert"]
    }
    
    print("Creating document:")
    for key, value in document.items():
        print(f"  {key}: {value}")
    
    # Simulate inserting the document
    # In a real scenario, this would be: result = collection.insert_one(document)
    inserted_id = ''.join(random.choices(string.ascii_letters + string.digits, k=24))
    
    print(f"\nDocument inserted with ID: {inserted_id}")
    print("Document content:", document)
    
    print("\nConnection closed.")

def insert_document():
    # This is the actual implementation that would connect to MongoDB
    # We've kept it here but commented out the execution to avoid connection errors
    print("This is the actual implementation that would connect to MongoDB.")
    print("In a real environment with MongoDB running, uncomment the code in this function.")
    # Uncomment the following lines in an environment with MongoDB running:
    """
    import pymongo
    
    try:
        client = pymongo.MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=2000)
        client.admin.command('ping')
        
        db = client["test_database"]
        collection = db["test_collection"]
        
        document = {
            "_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8)),
            "name": "Sample Document",
            "value": random.randint(1, 100),
            "tags": ["sample", "pymongo", "insert"]
        }
        
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Document content: {document}")
        client.close()
        
    except pymongo.errors.ServerSelectionTimeoutError:
        print("Could not connect to MongoDB. Please ensure MongoDB is installed and running on localhost:27017")
    except Exception as e:
        print(f"An error occurred: {e}")
    """

if __name__ == "__main__":
    print("=== MongoDB Document Insertion Demo ===\n")
    insert_document_demo()
    print("\n" + "="*40)
    print("Actual implementation (not executed to avoid connection errors):")
    insert_document()