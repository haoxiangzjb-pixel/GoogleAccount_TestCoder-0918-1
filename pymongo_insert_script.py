import pymongo
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or access database
        db = client["sample_db"]
        
        # Create or access collection
        collection = db["sample_collection"]
        
        # Document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "timestamp": pymongo.MongoClient().server_info()['ok'] if client.admin.command('ping')['ok'] == 1.0 else 'N/A',
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Verify the insertion by finding the document
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Inserted document: {inserted_doc}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please make sure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

def create_random_py_file():
    """Create a randomly named .py file with the PyMongo script"""
    random_filename = generate_random_filename()
    
    script_content = '''import pymongo
import random
import string

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or access database
        db = client["sample_db"]
        
        # Create or access collection
        collection = db["sample_collection"]
        
        # Document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "timestamp": "2023-10-30",
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Verify the insertion by finding the document
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Inserted document: {inserted_doc}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please make sure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    insert_document()
'''
    
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"Random Python script created: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Create the random .py file
    random_file = create_random_py_file()
    
    # Also run the insert function in this script
    print("\\nRunning the document insertion...")
    insert_document()