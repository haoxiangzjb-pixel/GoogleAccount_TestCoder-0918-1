
import pymongo

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or connect to a database
db = client["sample_database"]

# Create or connect to a collection
collection = db["sample_collection"]

# Document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "city": "New York"
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
