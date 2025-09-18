#!/usr/bin/env python3
"""
PyMongo script to insert a document into a MongoDB collection
"""
import pymongo
import random
import string

def insert_document():
    # Connect to MongoDB (assuming MongoDB is running locally)
    try:
        client = pymongo.MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=2000)
        
        # Test the connection
        client.admin.command('ping')
        
        # Create/access database
        db = client["test_database"]
        
        # Create/access collection
        collection = db["test_collection"]
        
        # Create a sample document
        document = {
            "_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8)),
            "name": "Sample Document",
            "value": random.randint(1, 100),
            "tags": ["sample", "pymongo", "insert"]
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Document content: {document}")
        
        # Close the connection
        client.close()
        
    except pymongo.errors.ServerSelectionTimeoutError:
        print("Could not connect to MongoDB. Please ensure MongoDB is installed and running on localhost:27017")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document()