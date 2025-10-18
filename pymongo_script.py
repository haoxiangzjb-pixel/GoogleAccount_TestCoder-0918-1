import pymongo
import random
import string

# Create a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Create a sample document to insert
sample_document = {
    "name": "John Doe",
    "age": 30,
    "email": "john.doe@example.com",
    "city": "New York",
    "date_created": "2023-01-01"
}

# Connect to MongoDB (assuming local MongoDB instance)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    
    # Create/access a database
    db = client["sample_database"]
    
    # Create/access a collection
    collection = db["sample_collection"]
    
    # Insert the document (make a copy to avoid modifying the original)
    import copy
    document_to_insert = copy.deepcopy(sample_document)
    result = collection.insert_one(document_to_insert)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Create the content for the randomly named Python file
    file_content = f'''# This is a randomly generated Python file
# Generated on: {result.inserted_id}

import pymongo

# Connection to MongoDB
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["sample_database"]
collection = db["sample_collection"]

# Sample document
document = {sample_document}

print("MongoDB document insertion script")
print(f"Inserted document ID: {{document.get('_id', 'N/A')}}')
'''
    
    # Generate random filename and save the content
    random_filename = generate_random_filename()
    
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    print(f"Random Python file created: {random_filename}")
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please ensure MongoDB is running.")
    
    # Create the content for the randomly named Python file even without MongoDB
    file_content = f'''# This is a randomly generated Python file

import pymongo

# Connection to MongoDB
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["sample_database"]
collection = db["sample_collection"]

# Sample document
document = {sample_document}

# Function to insert a document
def insert_sample_document():
    try:
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {{result.inserted_id}}")
        return result.inserted_id
    except Exception as e:
        print(f"Error inserting document: {{e}}")

if __name__ == "__main__":
    print("MongoDB document insertion script")
    print(f"Sample document: {{document}}")
    # Uncomment the next line to try inserting when MongoDB is available
    # insert_sample_document()
'''
    
    # Generate random filename and save the content
    random_filename = generate_random_filename()
    
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    print(f"Random Python file created: {random_filename}")
    
except Exception as e:
    print(f"An error occurred: {e}")
    
    # Create the content for the randomly named Python file even if there's an error
    file_content = f'''# This is a randomly generated Python file

import pymongo

# Connection to MongoDB
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["sample_database"]
collection = db["sample_collection"]

# Sample document
document = {sample_document}

# Function to insert a document
def insert_sample_document():
    try:
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {{result.inserted_id}}")
        return result.inserted_id
    except Exception as e:
        print(f"Error inserting document: {{e}}")

if __name__ == "__main__":
    print("MongoDB document insertion script")
    print(f"Sample document: {{document}}")
    # Uncomment the next line to try inserting when MongoDB is available
    # insert_sample_document()
'''
    
    # Generate random filename and save the content
    random_filename = generate_random_filename()
    
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    print(f"Random Python file created: {random_filename}")