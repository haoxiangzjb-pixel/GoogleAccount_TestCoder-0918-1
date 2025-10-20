import pymongo
import random
import string

# Create a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Sample PyMongo script to insert a document
script_content = '''
import pymongo

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or connect to a database
db = client["sample_database"]

# Create or connect to a collection
collection = db["sample_collection"]

# Document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "city": "New York"
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
'''

# Generate a random filename
random_filename = generate_random_filename()

# Write the script content to the randomly named file
with open(random_filename, 'w') as file:
    file.write(script_content)

print(f"PyMongo script saved to: {random_filename}")