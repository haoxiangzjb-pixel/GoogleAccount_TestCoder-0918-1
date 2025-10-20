import pymongo
import random
import string

# Connect to MongoDB (assuming local installation with default settings)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create a database
db = client["sample_database"]

# Create a collection
collection = db["sample_collection"]

# Generate a random document to insert
random_document = {
    "name": "Sample Document",
    "value": random.randint(1, 100),
    "description": "This is a randomly generated document",
    "timestamp": "2025-10-20",
    "id": ''.join(random.choices(string.ascii_letters + string.digits, k=10))
}

# Insert the document
result = collection.insert_one(random_document)

print(f"Document inserted with ID: {result.inserted_id}")

# Verify the insertion by finding the document
found_document = collection.find_one({"_id": result.inserted_id})
print(f"Inserted document: {found_document}")

# Close the connection
client.close()