import json
import random
import string
from datetime import datetime

def generate_mock_data():
    """Generates a mock JSON data structure."""
    data = {
        "status": "success",
        "timestamp": datetime.now().isoformat(),
        "data": {
            "user_id": random.randint(1000, 9999),
            "username": "".join(random.choices(string.ascii_lowercase, k=8)),
            "email": f"{''.join(random.choices(string.ascii_lowercase, k=5))}@example.com",
            "is_active": random.choice([True, False]),
            "profile": {
                "first_name": "".join(random.choices(string.ascii_letters, k=6)),
                "last_name": "".join(random.choices(string.ascii_letters, k=6)),
                "age": random.randint(18, 70)
            }
        }
    }
    return data

def save_to_random_file(data):
    """Saves data to a JSON file with a random name."""
    filename = f"api_response_{''.join(random.choices(string.ascii_lowercase + string.digits, k=10))}.json"
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)
    print(f"Data saved to {filename}")
    return filename

if __name__ == "__main__":
    mock_data = generate_mock_data()
    save_to_random_file(mock_data)