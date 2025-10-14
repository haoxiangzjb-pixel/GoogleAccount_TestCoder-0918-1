import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or standard remote connection)
# Replace the URI if your MongoDB instance is configured differently
client = MongoClient('mongodb://localhost:27017/')

# Specify the database and collection
db = client['sample_db']
collection = db['sample_collection']

# Generate a random string for the document ID
random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Define the document to be inserted
document = {
    "id": random_id,
    "name": "Sample Document",
    "value": 42,
    "description": "This is a sample document inserted by a PyMongo script."
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection (optional, as it's handled by garbage collection)
client.close()
