#!/usr/bin/env python3
"""
Script to generate a PyMongo script and save it to a randomly named .py file.
"""

import random
import string
import os


def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"


def create_pymongo_script_content():
    """Return the content of the PyMongo script as a string."""
    return '''#!/usr/bin/env python3
"""
A Python script using PyMongo to insert a document into a MongoDB collection.
"""

from pymongo import MongoClient
import random
import string


def insert_document():
    """
    Connect to MongoDB and insert a sample document.
    Note: This example assumes MongoDB is running locally on default port 27017.
    """
    try:
        # Connect to MongoDB (assumes MongoDB is running locally)
        client = MongoClient('mongodb://localhost:27017/')
        
        # Create/access a database
        db = client['sample_database']
        
        # Create/access a collection
        collection = db['sample_collection']
        
        # Create a sample document to insert
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-01-01T00:00:00Z"
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except Exception as e:
        print(f"An error occurred: {e}")
        return None


def main():
    """Main function to run the script."""
    print("Inserting document using PyMongo...")
    inserted_id = insert_document()
    
    if inserted_id:
        print("Document successfully inserted!")
    else:
        print("Failed to insert document.")


if __name__ == "__main__":
    main()
'''


def main():
    """Main function to create the randomly named PyMongo file."""
    random_filename = generate_random_filename()
    script_content = create_pymongo_script_content()
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"PyMongo script saved to: {random_filename}")
    print("The script will insert a document into a MongoDB collection when executed.")


if __name__ == "__main__":
    main()