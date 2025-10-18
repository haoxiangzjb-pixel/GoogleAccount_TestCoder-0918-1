# This is a randomly generated Python file

import pymongo

# Connection to MongoDB
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["sample_database"]
collection = db["sample_collection"]

# Sample document
document = {'name': 'John Doe', 'age': 30, 'email': 'john.doe@example.com', 'city': 'New York', 'date_created': '2023-01-01', '_id': ObjectId('68f330b26bc15b56061bbafb')}

# Function to insert a document
def insert_sample_document():
    try:
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")
        return result.inserted_id
    except Exception as e:
        print(f"Error inserting document: {e}")

if __name__ == "__main__":
    print("MongoDB document insertion script")
    print(f"Sample document: {document}")
    # Uncomment the next line to try inserting when MongoDB is available
    # insert_sample_document()
