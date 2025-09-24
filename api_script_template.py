import requests
import json
import random
import string

def generate_random_filename(length=8, prefix="api_data_", suffix=".json"):
    """Generates a random filename."""
    random_part = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    return f"{prefix}{random_part}{suffix}"

def fetch_and_save_api_data(url, output_filename):
    """Fetches data from the API and saves it to a file."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

        data = response.json()

        with open(output_filename, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4)

        print(f"Data successfully fetched from '{url}' and saved to '{output_filename}'.")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching the data: {e}")
    except json.JSONDecodeError:
        print("The response body was not valid JSON.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
    filename = generate_random_filename()
    fetch_and_save_api_data(API_URL, filename)

    # --- New Code to Create a Randomly Named Python Script ---
    import os
    random_script_name = generate_random_filename(suffix=".py")

    # Read the current script's content
    with open(__file__, 'r') as current_file:
        script_content = current_file.read()

    # Write the content to the new, randomly named file
    with open(random_script_name, 'w') as new_file:
        new_file.write(script_content)

    print(f"This script has been copied to a new file: {random_script_name}")
    # Optionally, run the new script
    # os.system(f"python3 {random_script_name}")
    # -----------------------------------------------
