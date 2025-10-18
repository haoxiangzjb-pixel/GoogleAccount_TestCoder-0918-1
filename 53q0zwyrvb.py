import pymongo
import random
import string

# Create a connection to MongoDB (assuming it's running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or connect to a database
db = client["sample_db"]

# Create or connect to a collection
collection = db["sample_collection"]

# Create a sample document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10))
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Verify the document was inserted by finding it
inserted_doc = collection.find_one({"_id": result.inserted_id})
print(f"Inserted document: {inserted_doc}")

# Close the connection
client.close()