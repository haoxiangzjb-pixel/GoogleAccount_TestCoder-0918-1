import random
import string
import pymongo

def generate_random_filename():
    """Generate a random filename with .py extension"""
    return ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'

def create_mongo_script():
    """Create a Python script that inserts a document using PyMongo"""
    # Script content
    script_content = '''# MongoDB document insertion script
from pymongo import MongoClient

# Connect to MongoDB (adjust connection string as needed)
client = MongoClient("mongodb://localhost:27017/")

# Access database and collection (creates them if they don't exist)
db = client["test_database"]
collection = db["test_collection"]

# Document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "interests": ["Python", "MongoDB", "Databases"]
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print("All documents in collection:")
for doc in collection.find():
    print(doc)

# Close the connection
client.close()
'''

    # Generate random filename
    filename = generate_random_filename()
    
    # Write script to file
    with open(filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as {filename}")
    return filename

if __name__ == "__main__":
    created_file = create_mongo_script()