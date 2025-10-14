import json
import random
import string

# Define the structure of the API response data
api_data = {
    "status": "success",
    "data": {
        "id": random.randint(1, 1000),
        "name": "Sample Item",
        "value": round(random.uniform(10.0, 100.0), 2),
        "tags": ["api", "mock", "data"]
    },
    "timestamp": "2023-10-27T10:00:00Z"
}

# Generate a random filename
random_filename = "api_response_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".json"

# Write the data to the randomly named JSON file
with open(random_filename, 'w') as f:
    json.dump(api_data, f, indent=4)

print(f"Generated JSON data saved to {random_filename}")