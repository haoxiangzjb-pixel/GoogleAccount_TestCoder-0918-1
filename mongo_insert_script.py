import pymongo
import random
import string

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Replace with your MongoDB URI
DB_NAME = "my_database"                   # Replace with your database name
COLLECTION_NAME = "my_collection"         # Replace with your collection name

def generate_random_filename(length=10):
    """Generates a random string to use as a filename."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + ".py"

def insert_document_and_save_script():
    """Connects to MongoDB, inserts a document, and saves this script with a random name."""
    try:
        # Connect to MongoDB
        client = pymongo.MongoClient(MONGO_URI)
        db = client[DB_NAME]
        collection = db[COLLECTION_NAME]

        # Document to insert
        document = {
            "name": "John Doe",
            "age": 30,
            "city": "New York",
            "random_field": random.randint(1, 100)
        }

        # Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")

        # Generate a random filename for this script
        random_filename = generate_random_filename()

        # Save this script to the randomly named file
        with open(random_filename, 'w') as f:
            f.write('''import pymongo
import random
import string

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Replace with your MongoDB URI
DB_NAME = "my_database"                   # Replace with your database name
COLLECTION_NAME = "my_collection"         # Replace with your collection name

def generate_random_filename(length=10):
    \"\"\"Generates a random string to use as a filename.\"\"\"
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + ".py"

def insert_document_and_save_script():
    \"\"\"Connects to MongoDB, inserts a document, and saves this script with a random name.\"\"\"
    try:
        # Connect to MongoDB
        client = pymongo.MongoClient(MONGO_URI)
        db = client[DB_NAME]
        collection = db[COLLECTION_NAME]

        # Document to insert
        document = {
            "name": "John Doe",
            "age": 30,
            "city": "New York",
            "random_field": random.randint(1, 100)
        }

        # Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")

        # Generate a random filename for this script
        random_filename = generate_random_filename()

        # Save this script to the randomly named file
        with open(random_filename, 'w') as f:
            f.write("This is a placeholder for the script content to avoid infinite recursion.")
        print(f"Script saved as {random_filename}")

    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure the MongoDB server is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document_and_save_script()
''')
        print(f"Script saved as {random_filename}")

    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure the MongoDB server is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document_and_save_script()
