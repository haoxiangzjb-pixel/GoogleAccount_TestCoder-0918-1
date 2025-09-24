import requests
import json
import os

def call_api_and_save(url, output_filename):
  """
  Calls a REST API, checks for success, and saves the response to a file.

  Args:
    url: The URL of the REST API endpoint.
    output_filename: The name of the file to save the response to.
  """
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)

    # Parse the JSON response
    data = response.json()

    # Save the data to the specified file
    with open(output_filename, 'w', encoding='utf-8') as f:
      json.dump(data, f, indent=4)

    print(f"API call successful. Data saved to {output_filename}")

  except requests.exceptions.RequestException as e:
    print(f"An error occurred during the API call: {e}")
  except json.JSONDecodeError as e:
    print(f"An error occurred while parsing the JSON response: {e}")
  except IOError as e:
    print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
  # Example API: JSONPlaceholder, a fake online REST API for testing
  API_URL = "https://jsonplaceholder.typicode.com/posts/1"
  OUTPUT_FILE = "api_response.json"
  call_api_and_save(API_URL, OUTPUT_FILE)
