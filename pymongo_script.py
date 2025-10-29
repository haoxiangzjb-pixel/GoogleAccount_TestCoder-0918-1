import pymongo
import random
import string

# Connect to MongoDB (assuming MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create a random database name
db_name = "test_db_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
db = client[db_name]

# Create a random collection name
collection_name = "test_collection_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
collection = db[collection_name]

# Create a document to insert with random elements
document = {
    "name": "John Doe",
    "age": 30,
    "email": f"john.doe.{random.randint(1000, 9999)}@example.com",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
    "timestamp": pymongo.MongoClient().server_info()['localTime'] if client.server_info() else None
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print(f"Database: {db_name}")
print(f"Collection: {collection_name}")
print(f"Inserted document: {document}")

# Close the connection
client.close()