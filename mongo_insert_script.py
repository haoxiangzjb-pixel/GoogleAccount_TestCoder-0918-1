import pymongo
import random
import string

# Define the sample document
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

try:
    # Connect to MongoDB (assumes a local instance or adjust connection string)
    client = pymongo.MongoClient("mongodb://localhost:27017/")

    # Access a database (creates if it doesn't exist)
    db = client["sample_db"]

    # Access a collection (creates if it doesn't exist)
    collection = db["sample_collection"]

    # Insert the document into the collection
    result = collection.insert_one(document_to_insert)

    # Print the ID of the inserted document
    print(f"Document inserted with ID: {result.inserted_id}")
except pymongo.errors.ServerSelectionTimeoutError:
    print("Could not connect to MongoDB server. Proceeding to create the random file without inserting the document.")
    print(f"Document to insert: {document_to_insert}")

# Generate a random filename
random_filename = "mongo_script_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

# Save this script to the random filename
with open(random_filename, 'w') as f:
    f.write('''import pymongo
import random
import string

# Connect to MongoDB (assumes a local instance or adjust connection string)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Access a database (creates if it doesn't exist)
db = client["sample_db"]

# Access a collection (creates if it doesn't exist)
collection = db["sample_collection"]

# Define the sample document *after* connection setup in the saved script
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Attempt to insert the document into the collection
try:
    result = collection.insert_one(document_to_insert)
    print(f"Document inserted with ID: {result.inserted_id}")
except pymongo.errors.ServerSelectionTimeoutError:
    print("Could not connect to MongoDB server in the saved script.")
    print(f"Document to insert: {document_to_insert}")

# Generate a random filename
random_filename = "mongo_script_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

# Save this script to the random filename
# This part is omitted in the saved script to prevent infinite recursion
''')

print(f"Script saved to {random_filename}")
