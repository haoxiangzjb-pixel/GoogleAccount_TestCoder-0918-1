import random
import string
from pymongo import MongoClient
import sys

# Generate a random string for the filename
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.py'

# Define the document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_filename": random_filename
}

try:
    # Connect to MongoDB (assumes a local instance or adjust the URI)
    client = MongoClient('mongodb://localhost:27017/')

    # Access a database (creates it if it doesn't exist)
    db = client['sample_database']

    # Access a collection (creates it if it doesn't exist)
    collection = db['sample_collection']

    # Insert the document into the collection
    result = collection.insert_one(document)

    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Random filename generated: {random_filename}")
    
except Exception as e:
    print(f"Could not connect to MongoDB or insert document: {e}")
    print("Generating the random file anyway as per the request.")
    print(f"Random filename generated: {random_filename}")

# Save the script with the random filename
with open(random_filename, 'w') as f:
    f.write('# Auto-generated script\nprint("Hello from the auto-generated script!")\n')

print(f"Auto-generated script saved as {random_filename}")
