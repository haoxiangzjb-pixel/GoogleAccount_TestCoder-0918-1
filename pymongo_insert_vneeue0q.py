#!/usr/bin/env python3
"""
PyMongo script to insert a document into a MongoDB collection.
This script connects to a MongoDB instance and inserts a sample document.
"""

from pymongo import MongoClient
from datetime import datetime
import random
import string

def connect_to_mongodb():
    """
    Connect to MongoDB. 
    In a real application, you would use actual connection parameters.
    """
    try:
        # For this example, using localhost with default port
        # In a real scenario, you'd want to use proper connection string
        client = MongoClient('mongodb://localhost:27017/')
        return client
    except Exception as e:
        print(f"Error connecting to MongoDB: {e}")
        return None

def insert_document():
    """
    Insert a sample document into a collection.
    """
    client = connect_to_mongodb()
    
    if client is None:
        print("Cannot proceed without MongoDB connection.")
        return
    
    try:
        # Create/get database and collection
        db = client['sample_database']
        collection = db['sample_collection']
        
        # Create a sample document with random data
        sample_document = {
            'name': 'Sample Document',
            'description': 'This is a sample document inserted using PyMongo',
            'timestamp': datetime.now(),
            'random_id': ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
            'value': random.randint(1, 100)
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print("Document content:")
        print(f"  Name: {sample_document['name']}")
        print(f"  Description: {sample_document['description']}")
        print(f"  Timestamp: {sample_document['timestamp']}")
        print(f"  Random ID: {sample_document['random_id']}")
        print(f"  Value: {sample_document['value']}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"Error inserting document: {e}")
        if client:
            client.close()

if __name__ == "__main__":
    print("Starting PyMongo insert operation...")
    insert_document()
    print("Operation completed.")