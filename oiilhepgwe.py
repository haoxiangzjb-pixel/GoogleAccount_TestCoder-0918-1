# MongoDB document insertion script
from pymongo import MongoClient

# Connect to MongoDB (adjust connection string as needed)
client = MongoClient("mongodb://localhost:27017/")

# Access database and collection (creates them if they don't exist)
db = client["test_database"]
collection = db["test_collection"]

# Document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "interests": ["Python", "MongoDB", "Databases"]
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print("All documents in collection:")
for doc in collection.find():
    print(doc)

# Close the connection
client.close()
