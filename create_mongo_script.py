import random
import string
from pymongo import MongoClient

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"mongo_insert_{random_chars}.py"

def create_mongo_script():
    """Create a Python script that inserts a document using PyMongo"""
    script_content = '''# PyMongo Document Insertion Script
from pymongo import MongoClient

# Connect to MongoDB (assuming it's running locally on default port)
client = MongoClient('mongodb://localhost:27017/')

# Access database and collection (they will be created if they don't exist)
db = client['test_database']
collection = db['test_collection']

# Document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "interests": ["Python", "MongoDB", "Data Science"]
}

# Insert the document
result = collection.insert_one(document)

# Print result
print(f"Inserted document with ID: {result.inserted_id}")

# Verify insertion by finding the document
found_document = collection.find_one({"_id": result.inserted_id})
print(f"Found document: {found_document}")

# Close the connection
client.close()
'''
    return script_content

# Generate random filename
filename = generate_random_filename()

# Create the script content
script_content = create_mongo_script()

# Write to file
with open(filename, 'w') as f:
    f.write(script_content)

print(f"Python script saved to {filename}")