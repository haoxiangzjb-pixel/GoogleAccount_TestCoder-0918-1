import random
import string
import os

# PyMongo script content
pymongo_script = '''import pymongo
import random
import string

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or connect to a database
db = client["sample_database"]

# Create or connect to a collection
collection = db["sample_collection"]

# Create a sample document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10))
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Verify the document was inserted by finding it
found_document = collection.find_one({"_id": result.inserted_id})
print(f"Inserted document: {found_document}")

# Close the connection
client.close()
'''

# Generate a random filename with .py extension
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Write the script to the randomly named file
with open(random_filename, 'w') as f:
    f.write(pymongo_script)

print(f"PyMongo script saved to: {random_filename}")