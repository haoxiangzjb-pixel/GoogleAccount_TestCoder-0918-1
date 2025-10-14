import json
import random
import string
import os

# Define the data structure for the API response
api_response_data = {
    "status": "success",
    "data": [
        {
            "id": 1,
            "name": "Product A",
            "price": 29.99,
            "in_stock": True
        },
        {
            "id": 2,
            "name": "Product B",
            "price": 39.99,
            "in_stock": False
        },
        {
            "id": 3,
            "name": "Product C",
            "price": 19.99,
            "in_stock": True
        }
    ],
    "total_count": 3,
    "page": 1
}

# Function to generate a random filename
def generate_random_filename(length=8, prefix="api_data_", suffix=".json"):
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    return f"{prefix}{random_string}{suffix}"

# Generate a random filename
filename = generate_random_filename()

# Define the full path for the new file
file_path = os.path.join("/workspace/data", filename)

# Write the JSON data to the file
with open(file_path, 'w', encoding='utf-8') as f:
    json.dump(api_response_data, f, indent=2)

print(f"API response data saved to {file_path}")