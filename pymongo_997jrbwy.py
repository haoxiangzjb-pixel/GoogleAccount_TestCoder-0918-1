import pymongo
import random
import string

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create/access a database
db = client["sample_database"]

# Create/access a collection
collection = db["sample_collection"]

# Create a sample document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "email": "john.doe@example.com",
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10))
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Verify the document was inserted
retrieved_doc = collection.find_one({"_id": result.inserted_id})
print(f"Retrieved document: {retrieved_doc}")

# Close the connection
client.close()