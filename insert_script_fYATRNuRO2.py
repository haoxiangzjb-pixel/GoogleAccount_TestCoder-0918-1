import random
from pymongo import MongoClient

# Connect to MongoDB
client = MongoClient("mongodb://localhost:27017/")
db = client["test_db"]
collection = db["test_collection"]

# Document to insert
document = {
    "name": "Jane Smith",
    "age": 25,
    "city": "San Francisco",
    "random_id": random.randint(1000, 9999)
}

# Insert the document
result = collection.insert_one(document)
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
