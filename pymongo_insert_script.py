import pymongo
import random
import string

# Generate a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Create a sample PyMongo insert script
def create_pymongo_script():
    script_content = '''import pymongo

# Connect to MongoDB (assuming local installation with default settings)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or access a database
db = client["sample_database"]

# Create or access a collection
collection = db["sample_collection"]

# Document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "city": "New York",
    "timestamp": "2023-01-01T00:00:00Z"
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
'''
    return script_content

# Generate the random filename
random_filename = generate_random_filename()

# Write the script to the randomly named file
with open(random_filename, 'w') as file:
    file.write(create_pymongo_script())

print(f"PyMongo insert script saved to: {random_filename}")