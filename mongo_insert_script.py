"""
This script demonstrates how to insert a document into a MongoDB collection using PyMongo.
It connects to a local MongoDB instance, selects a database and collection,
creates a sample document, and inserts it.
"""

import pymongo
import random
import string

# 1. Connect to the MongoDB server (assumes MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# 2. Access a database (creates it if it doesn't exist)
db = client["sample_database"]

# 3. Access a collection within the database (creates it if it doesn't exist)
collection = db["sample_collection"]

# 4. Create a sample document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))  # Add a random ID for uniqueness
}

# 5. Insert the document into the collection
insert_result = collection.insert_one(document_to_insert)

# 6. Print the ID of the inserted document
print(f"Document inserted with ID: {insert_result.inserted_id}")

# 7. Close the connection (optional, as it will close when the script ends)
client.close()

print("Script execution completed.")