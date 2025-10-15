import pymongo
import random
import string

# Create a connection to MongoDB (assumes MongoDB is running locally)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or connect to a database
db = client["sample_database"]

# Create or connect to a collection
collection = db["sample_collection"]

# Create a sample document to insert
sample_document = {
    "name": "John Doe",
    "age": 30,
    "email": "john.doe@example.com",
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10))
}

# Insert the document into the collection
result = collection.insert_one(sample_document)

print(f"Document inserted with ID: {result.inserted_id}")

# Verify the document was inserted by finding it
found_document = collection.find_one({"_id": result.inserted_id})
print(f"Inserted document: {found_document}")

# Close the connection
client.close()