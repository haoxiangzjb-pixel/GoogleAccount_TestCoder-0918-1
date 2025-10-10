import requests
import random
import string

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API endpoint
OUTPUT_DIR = "/workspace"  # Directory to save the file

def generate_random_filename(length=8, prefix="api_script_", suffix=".py"):
    """Generates a random filename with a prefix, random string, and suffix."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    return f"{prefix}{random_string}{suffix}"

def fetch_and_save_api_call(url, output_dir):
    """Fetches data from the API and saves the Python script to a randomly named file."""
    script_content = f'''import requests

# Automatically generated script to call a REST API
API_ENDPOINT = "{url}"

def main():
    try:
        response = requests.get(API_ENDPOINT)
        response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)

        print("Status Code:", response.status_code)
        print("Response Headers:", response.headers)
        print("\\nResponse JSON:")
        print(response.json())

    except requests.exceptions.HTTPError as http_err:
        print(f"HTTP error occurred: {{http_err}}")
    except requests.exceptions.ConnectionError as conn_err:
        print(f"Connection error occurred: {{conn_err}}")
    except requests.exceptions.Timeout as timeout_err:
        print(f"Timeout error occurred: {{timeout_err}}")
    except requests.exceptions.RequestException as req_err:
        print(f"An error occurred: {{req_err}}")
    except ValueError as json_err: # Catch errors in .json() parsing
        print(f"JSON decode error: {{json_err}}")
        print("Response Text (for debugging):", response.text)

if __name__ == "__main__":
    main()
'''

    random_filename = generate_random_filename()
    full_path = f"{output_dir}/{random_filename}"

    with open(full_path, 'w') as f:
        f.write(script_content)

    print(f"Python script calling the API has been written to: {full_path}")

if __name__ == "__main__":
    fetch_and_save_api_call(API_URL, OUTPUT_DIR)
