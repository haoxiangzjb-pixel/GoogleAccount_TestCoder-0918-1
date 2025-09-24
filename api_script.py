import requests
import os
import uuid

# Example API endpoint (JSONPlaceholder for testing)
api_url = "https://jsonplaceholder.typicode.com/posts/1"

try:
    # Make the GET request
    response = requests.get(api_url)
    response.raise_for_status()  # Raise an exception for bad status codes

    # Generate a random filename
    random_filename = f"api_data_{uuid.uuid4().hex}.json"

    # Save the response content to the random file
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(response.text)

    print(f"API response saved to {random_filename}")

except requests.exceptions.RequestException as e:
    print(f"An error occurred while fetching the API: {e}")
except IOError as e:
    print(f"An error occurred while writing the file: {e}")
