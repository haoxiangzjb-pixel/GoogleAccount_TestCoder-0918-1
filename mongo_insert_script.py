import random
import string
from pymongo import MongoClient
from pymongo.errors import ServerSelectionTimeoutError

# Generate a random filename
random_filename = 'mongo_insert_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# MongoDB connection string (adjust as needed)
connection_string = "mongodb://localhost:27017/"
client = MongoClient(connection_string, serverSelectionTimeoutMS=5000) # 5 second timeout

# Connect to a database and collection
db = client['test_database']
collection = db['test_collection']

# Document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
}

# Insert the document, handling potential connection errors
try:
    result = collection.insert_one(document_to_insert)
    print(f"Document inserted with ID: {result.inserted_id}")
    insert_success = True
except ServerSelectionTimeoutError as e:
    print(f"Could not connect to MongoDB server: {e}. Proceeding to save the script anyway.")
    insert_success = False

# Write a copy of this script with a random name
with open(random_filename, 'w') as f:
    f.write('# Auto-generated script to insert a document into MongoDB\\n')
    if insert_success:
        f.write('# Document inserted: ' + str(document_to_insert) + '\\n\\n')
    else:
        f.write('# A connection to MongoDB could not be established, but this script would insert the following document: ' + str(document_to_insert) + '\\n\\n')
    f.write('from pymongo import MongoClient\\n\\n')
    f.write('client = MongoClient("' + connection_string + '")\\n')
    f.write('db = client["test_database"]\\n')
    f.write('collection = db["test_collection"]\\n\\n')
    f.write('document = ' + str(document_to_insert) + '\\n\\n')
    f.write('result = collection.insert_one(document)\\n')
    f.write('print("Saved document inserted with ID:", result.inserted_id)\\n')

print(f"Script saved to {random_filename}")