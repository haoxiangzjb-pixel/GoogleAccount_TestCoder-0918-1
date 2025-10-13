import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or adjust the URI)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_test_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_test_collection']

# Generate a random string for the filename
random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_script_name": random_filename
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print(f"Generated random filename: {random_filename}")

# Save this script to the randomly generated filename
with open(random_filename, 'w') as f:
    f.write('''import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or adjust the URI)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_test_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_test_collection']

# Generate a random string for the filename
random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_script_name": random_filename
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print(f"Generated random filename: {random_filename}")

# Save this script to the randomly generated filename
# This part is omitted in the saved script to prevent infinite recursion
# with open(random_filename, 'w') as f:
#     f.write(...)
''')

print(f"Script saved as {random_filename}")