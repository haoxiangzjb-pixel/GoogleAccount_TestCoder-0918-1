import pymongo
import random
import string

# Generate a random identifier for the document
random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Connect to MongoDB (assumes MongoDB is running locally)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    
    # Create/access a database
    db = client["sample_db"]
    
    # Create/access a collection
    collection = db["sample_collection"]
    
    # Create a sample document to insert
    sample_document = {
        "name": f"Sample User {random_id}",
        "age": random.randint(18, 65),
        "email": f"user{random_id}@example.com",
        "city": random.choice(["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]),
        "registration_date": "2023-10-28",
        "random_id": random_id
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Sample document: {sample_document}")
    
    # Verify the document was inserted
    retrieved_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {retrieved_doc}")
    
    # Close the connection
    client.close()
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please ensure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")

# Save this script to a randomly named file
random_script_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=15)) + '.py'
with open(random_script_name, 'w') as f:
    f.write('# This is a randomly saved version of the PyMongo script\\n')
    f.write('# Document inserted with ID: ' + str(result.inserted_id) + '\\n')
    f.write('# Random ID: ' + random_id + '\\n')
    f.write('# Saved at: ' + random_script_name + '\\n')

print(f"Script also saved to randomly named file: {random_script_name}")