import random
import string
from pymongo import MongoClient
from pymongo.errors import ServerSelectionTimeoutError

# Generate a random string for the filename
random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_script_name": random_filename
}

# Attempt to connect to MongoDB and insert the document
try:
    # Connect to MongoDB (assumes a local instance or adjust the URI)
    client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
    
    # Access a database (creates it if it doesn't exist)
    db = client['my_test_database']

    # Access a collection (creates it if it doesn't exist)
    collection = db['my_test_collection']

    # Insert the document into the collection
    result = collection.insert_one(document)

    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Generated random filename: {random_filename}")
except ServerSelectionTimeoutError:
    print("Could not connect to MongoDB server. Proceeding to save the script anyway.")
    print(f"Generated random filename: {random_filename}")

# Save this script to the randomly generated filename
script_content = '''import random
import string
from pymongo import MongoClient
from pymongo.errors import ServerSelectionTimeoutError

# Generate a random string for the filename
random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_script_name": random_filename
}

# Attempt to connect to MongoDB and insert the document
try:
    # Connect to MongoDB (assumes a local instance or adjust the URI)
    client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
    
    # Access a database (creates it if it doesn't exist)
    db = client['my_test_database']

    # Access a collection (creates it if it doesn't exist)
    collection = db['my_test_collection']

    # Insert the document into the collection
    result = collection.insert_one(document)

    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Generated random filename: {random_filename}")
except ServerSelectionTimeoutError:
    print("Could not connect to MongoDB server. Proceeding to save the script anyway.")
    print(f"Generated random filename: {random_filename}")
'''

with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved as {random_filename}")