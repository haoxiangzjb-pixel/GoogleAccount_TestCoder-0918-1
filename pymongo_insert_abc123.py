import pymongo
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"pymongo_document_{random_string}.py"

# Connect to MongoDB (assumes MongoDB is running locally)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    
    # Create/access a database
    db = client["sample_db"]
    
    # Create/access a collection
    collection = db["sample_collection"]
    
    # Create a sample document to insert
    sample_document = {
        "name": "John Doe",
        "age": 30,
        "email": "john.doe@example.com",
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Sample document: {sample_document}")
    
    # Verify the document was inserted
    retrieved_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {retrieved_doc}")
    
    # Close the connection
    client.close()
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please ensure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")