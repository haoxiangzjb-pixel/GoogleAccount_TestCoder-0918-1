#!/usr/bin/env python3
"""
PyMongo script to insert a document into MongoDB.
"""

from pymongo import MongoClient

def main():
    # Connect to MongoDB (adjust the connection string as needed)
    client = MongoClient("mongodb://localhost:27017/")
    
    # Select database and collection
    db = client["my_database"]
    collection = db["my_collection"]
    
    # Create a document to insert
    document = {
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "email": "john.doe@example.com"
    }
    
    # Insert the document
    result = collection.insert_one(document)
    
    print(f"Document inserted with _id: {result.inserted_id}")

if __name__ == "__main__":
    main()
