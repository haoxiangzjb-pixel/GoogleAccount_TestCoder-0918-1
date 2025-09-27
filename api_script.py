import requests
import json
import os

def fetch_and_save_api_data(url, output_file):
  """
  Fetches data from a REST API and saves it to a file.

  Args:
    url: The URL of the REST API endpoint.
    output_file: The name of the file to save the data to.
  """
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes

    data = response.json()

    with open(output_file, 'w', encoding='utf-8') as f:
      json.dump(data, f, indent=4)

    print(f"Data successfully fetched from {url} and saved to {output_file}")

  except requests.exceptions.RequestException as e:
    print(f"An error occurred while fetching data: {e}")
  except json.JSONDecodeError:
    print("Error: The response is not valid JSON.")
  except IOError as e:
    print(f"An error occurred while writing to the file: {e}")

if __name__ == "__main__":
  # Example API endpoint (JSONPlaceholder is a common test API)
  api_url = "https://jsonplaceholder.typicode.com/posts/1"
  # Generate a random filename
  random_filename = f"api_output_{os.urandom(8).hex()}.json"

  fetch_and_save_api_data(api_url, random_filename)
