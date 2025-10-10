import requests
import json
import os
import random
import string

def call_api_and_save():
    # Example API endpoint (JSONPlaceholder for testing)
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the GET request
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Parse the JSON response
        data = response.json()

        # Generate a random filename
        random_filename = "api_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

        # Save the data to the randomly named file
        with open(random_filename, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4)

        print(f"API data successfully retrieved and saved to {random_filename}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
    except json.JSONDecodeError as e:
        print(f"An error occurred while parsing the JSON response: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    call_api_and_save()