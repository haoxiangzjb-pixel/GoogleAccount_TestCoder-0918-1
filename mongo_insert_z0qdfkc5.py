# PyMongo Document Insertion Script
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
