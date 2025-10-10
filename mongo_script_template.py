import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes local instance on default port 27017)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['sample_db']

# Access a collection (creates it if it doesn't exist)
collection = db['sample_collection']

# Create a sample document
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
