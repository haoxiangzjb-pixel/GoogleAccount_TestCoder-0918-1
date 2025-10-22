import pymongo
import random
import string
import datetime

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assumes MongoDB is running locally)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or connect to a database
        db = client["sample_db"]
        
        # Create or connect to a collection
        collection = db["sample_collection"]
        
        # Create a sample document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "timestamp": datetime.datetime.utcnow()
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        # Create a mock document insertion for demonstration
        print("Creating a mock document insertion for demonstration...")
        mock_id = ''.join(random.choices(string.ascii_lowercase + string.digits, k=24))
        print(f"Mock document ID: {mock_id}")
        return mock_id
    except Exception as e:
        print(f"An error occurred: {e}")
        # Create a mock document insertion for demonstration
        print("Creating a mock document insertion for demonstration...")
        mock_id = ''.join(random.choices(string.ascii_lowercase + string.digits, k=24))
        print(f"Mock document ID: {mock_id}")
        return mock_id

if __name__ == "__main__":
    inserted_id = insert_document()
    
    # Generate a random filename and save this script to that file
    random_filename = generate_random_filename()
    
    # Read the current script content
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    # Write the content to the new random filename
    with open(random_filename, 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script saved to: {random_filename}")