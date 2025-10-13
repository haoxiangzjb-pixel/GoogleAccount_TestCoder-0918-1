import json
import random
import string
from datetime import datetime

def generate_api_data():
    """Generates a mock JSON API response and saves it to a file with a random name."""
    # Sample data structure
    data = {
        "status": "success",
        "timestamp": datetime.now().isoformat(),
        "data": [
            {
                "id": i,
                "name": f"Item {i}",
                "value": random.randint(1, 100),
                "description": "".join(random.choices(string.ascii_letters + string.digits, k=20))
            }
            for i in range(1, 6)  # Generate 5 items
        ]
    }

    # Generate a random filename
    random_filename = "api_response_" + "".join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".json"
    full_path = f"/workspace/{random_filename}"

    # Write the data to the file
    with open(full_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2)

    print(f"API response data generated and saved to {full_path}")
    return full_path

if __name__ == "__main__":
    generate_api_data()