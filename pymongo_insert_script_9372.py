#!/usr/bin/env python3
"""
A Python script using PyMongo to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def generate_random_document():
    """Generate a random document to insert into MongoDB"""
    # Create a random string for the name field
    random_name = ''.join(random.choices(string.ascii_letters, k=10))
    random_age = random.randint(18, 80)
    random_score = random.uniform(0, 100)
    
    document = {
        "name": random_name,
        "age": random_age,
        "score": random_score,
        "created_at": "2023-01-01",
        "status": "active"
    }
    
    return document

def insert_document():
    """Connect to MongoDB and insert a document"""
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
        client = MongoClient('mongodb://localhost:27017/')
        
        # Access a database (creates it if it doesn't exist)
        db = client['sample_database']
        
        # Access a collection (creates it if it doesn't exist)
        collection = db['sample_collection']
        
        # Generate and insert a random document
        document = generate_random_document()
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Inserted document: {document}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document()