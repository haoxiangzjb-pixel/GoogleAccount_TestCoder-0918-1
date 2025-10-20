import random
import string
import os

def generate_random_filename():
    """Generate a random Python filename"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_pymongo_script():
    """Create the PyMongo script content"""
    script_content = '''import pymongo
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
'''
    return script_content

def main():
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create the PyMongo script content
    script_content = create_pymongo_script()
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"PyMongo script created: {random_filename}")
    return random_filename

if __name__ == "__main__":
    main()