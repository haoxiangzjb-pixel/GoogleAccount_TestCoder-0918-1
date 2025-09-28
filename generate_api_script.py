import requests
import random
import string

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
OUTPUT_DIR = "/workspace"

def generate_random_filename(length=8, prefix="api_script_", suffix=".py"):
    """Generates a random filename."""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    return f"{prefix}{random_chars}{suffix}"

def fetch_and_save_api_data(url, output_path):
    """Fetches data from the API and saves a script to retrieve it to a file."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        api_data = response.json()

        script_content = f'''# Generated script to fetch data from {url}

import requests

def get_data():
    response = requests.get("{url}")
    response.raise_for_status()
    return response.json()

if __name__ == "__main__":
    data = get_data()
    print(data)

# Fetched Data (as a comment):
# {api_data}
'''

        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(script_content)

        print(f"API data fetched and script saved successfully to: {output_path}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching the API: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    random_filename = generate_random_filename()
    output_path = f"{OUTPUT_DIR}/{random_filename}"
    fetch_and_save_api_data(API_URL, output_path)
