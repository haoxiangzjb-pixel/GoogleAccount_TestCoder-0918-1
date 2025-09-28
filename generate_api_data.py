import json
import random
import string

def generate_api_response():
    """Generates a mock JSON API response and saves it to a file with a random name."""
    # Sample data structure
    data = {
        "status": "success",
        "data": {
            "id": random.randint(1, 10000),
            "name": "".join(random.choices(string.ascii_letters, k=10)),
            "email": f"{''.join(random.choices(string.ascii_lowercase, k=5))}@example.com",
            "active": random.choice([True, False])
        },
        "message": "User data retrieved successfully."
    }

    # Generate a random filename
    random_filename = f"api_response_{''.join(random.choices(string.ascii_lowercase + string.digits, k=8))}.json"

    # Write the data to the file
    with open(random_filename, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)

    print(f"Mock API response data saved to {random_filename}")

if __name__ == "__main__":
    generate_api_response()
