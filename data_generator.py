import json
import random
import string
import os

def generate_mock_data():
    """Generates a mock JSON data structure."""
    data = {
        "status": "success",
        "data": {
            "id": random.randint(1, 1000),
            "name": "".join(random.choices(string.ascii_letters, k=10)),
            "email": f"{''.join(random.choices(string.ascii_lowercase, k=5))}@example.com",
            "active": random.choice([True, False]),
            "tags": random.sample(["new", "returning", "vip", "inactive"], k=2)
        }
    }
    return data

def save_to_random_file(data, directory="/workspace/data"):
    """Saves the given data to a randomly named JSON file in the specified directory."""
    random_filename = f"api_response_{''.join(random.choices(string.ascii_lowercase + string.digits, k=8))}.json"
    full_path = os.path.join(directory, random_filename)
    with open(full_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2)
    return full_path

if __name__ == "__main__":
    mock_data = generate_mock_data()
    saved_file_path = save_to_random_file(mock_data)
    print(f"Mock data saved to: {saved_file_path}")