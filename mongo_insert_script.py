import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Adjust if your MongoDB is elsewhere
DATABASE_NAME = "test_db"
COLLECTION_NAME = "test_collection"

# --- Generate Random Filename ---
def generate_random_filename(length=10):
    """Generates a random filename consisting of letters and digits."""
    letters_and_digits = string.ascii_letters + string.digits
    random_part = ''.join(random.choice(letters_and_digits) for _ in range(length))
    return f"insert_script_{random_part}.py"

# --- Main Execution ---
if __name__ == "__main__":
    # --- Create the Python script file ---
    script_content = f'''import random
from pymongo import MongoClient

# Connect to MongoDB
client = MongoClient("{MONGO_URI}")
db = client["{DATABASE_NAME}"]
collection = db["{COLLECTION_NAME}"]

# Document to insert
document = {{
    "name": "Jane Smith",
    "age": 25,
    "city": "San Francisco",
    "random_id": random.randint(1000, 9999)
}}

# Insert the document
result = collection.insert_one(document)
print(f"Document inserted with ID: {{result.inserted_id}}")

# Close the connection
client.close()
'''

    # Generate a random filename and save the script
    random_filename = generate_random_filename()
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Python script saved to: {{random_filename}}")
