import pymongo
import random
import string

# Connect to MongoDB (assuming local MongoDB instance)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or connect to a database
db = client["sample_db"]

# Create or connect to a collection
collection = db["sample_collection"]

# Create a sample document to insert
document = {
    "name": "Sample Document",
    "value": random.randint(1, 100),
    "description": "This is a randomly generated document",
    "timestamp": {"$date": "2023-01-01T00:00:00Z"}
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Verify the document was inserted by finding it
retrieved_doc = collection.find_one({"_id": result.inserted_id})
print(f"Retrieved document: {retrieved_doc}")

# Close the connection
client.close()