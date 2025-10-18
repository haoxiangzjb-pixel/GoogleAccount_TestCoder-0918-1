import pymongo
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Create a MongoDB client (assumes MongoDB is running locally)
        # If using MongoDB Atlas or a remote server, change the connection string accordingly
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Access a database (creates it if it doesn't exist)
        db = client["sample_database"]
        
        # Access a collection (creates it if it doesn't exist)
        collection = db["sample_collection"]
        
        # Create a sample document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "city": "New York",
            "timestamp": "2025-10-18"
        }
        
        # Insert the document into the collection
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

def create_random_py_file():
    """Create a randomly named .py file with this script content"""
    import os
    import shutil
    
    # Generate a random filename
    random_filename = generate_random_filename()
    random_filepath = f"/workspace/{random_filename}"
    
    # Copy this script to the random filename
    current_script = __file__
    shutil.copy(current_script, random_filepath)
    
    print(f"Script saved to: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    print("Inserting document into MongoDB...")
    inserted_id = insert_document()
    
    if inserted_id:
        print("\nCreating randomly named .py file...")
        create_random_py_file()
    else:
        print("Document insertion failed, skipping file creation.")