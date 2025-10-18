import pymongo
import random
import string
from datetime import datetime

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def simulate_document_insertion():
    """Simulate inserting a document (without actual MongoDB connection)"""
    try:
        # Create a sample document that would be inserted
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "city": "New York",
            "timestamp": datetime.now().isoformat()
        }
        
        # Generate a simulated document ID (in real MongoDB, this would be an ObjectId)
        simulated_id = ''.join(random.choices(string.ascii_lowercase + string.digits, k=24))
        
        print(f"Simulated document insertion. Document would be inserted with ID: {simulated_id}")
        print(f"Document content: {sample_document}")
        
        return simulated_id
        
    except Exception as e:
        print(f"An error occurred during simulation: {e}")
        return None

def create_random_py_file():
    """Create a randomly named .py file with this script content"""
    import os
    import shutil
    
    # Generate a random filename
    random_filename = generate_random_filename()
    random_filepath = f"/workspace/{random_filename}"
    
    # Copy this script to the random filename
    current_script = __file__
    shutil.copy(current_script, random_filepath)
    
    print(f"Script saved to: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    print("Simulating document insertion into MongoDB...")
    inserted_id = simulate_document_insertion()
    
    if inserted_id:
        print("\nCreating randomly named .py file...")
        created_file = create_random_py_file()
        print(f"Successfully created: {created_file}")
    else:
        print("Document insertion simulation failed.")