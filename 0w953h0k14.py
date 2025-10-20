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
        # Connect to MongoDB (assumes MongoDB is running locally)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or connect to a database
        db = client["sample_db"]
        
        # Create or connect to a collection
        collection = db["sample_collection"]
        
        # Create a sample document to insert
        document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "timestamp": pymongo.datetime.datetime.utcnow()
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please make sure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    # First, save this script to a randomly named file
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    with open(random_filename, 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    
    # Then try to insert a document (this will show the functionality)
    inserted_id = insert_document()
    
    if inserted_id:
        print(f"Document was successfully inserted with ID: {inserted_id}")
    else:
        print("Document insertion was attempted but may have failed due to MongoDB not being available.")