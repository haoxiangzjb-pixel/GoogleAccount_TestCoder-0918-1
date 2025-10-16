import pymongo

# Connect to MongoDB (assuming local installation with default settings)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or access a database
db = client["sample_database"]

# Create or access a collection
collection = db["sample_collection"]

# Document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "city": "New York",
    "timestamp": "2023-01-01T00:00:00Z"
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
