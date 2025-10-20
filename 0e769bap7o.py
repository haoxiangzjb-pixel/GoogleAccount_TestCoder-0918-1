import pymongo
import random
import string

# Generate a random collection name
def generate_random_name():
    return ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))

# Connect to MongoDB (assuming MongoDB is running locally on default port 27017)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    
    # Create a random database name
    db_name = f"test_db_{generate_random_name()}"
    db = client[db_name]
    
    # Create a random collection name
    collection_name = f"test_collection_{generate_random_name()}"
    collection = db[collection_name]
    
    # Document to insert
    document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "city": "New York",
        "random_id": generate_random_name()
    }
    
    # Insert the document
    result = collection.insert_one(document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Database: {db_name}")
    print(f"Collection: {collection_name}")
    
    # Verify the document was inserted
    retrieved_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {retrieved_doc}")

except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please make sure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")

finally:
    # Close the connection
    if 'client' in locals():
        client.close()
