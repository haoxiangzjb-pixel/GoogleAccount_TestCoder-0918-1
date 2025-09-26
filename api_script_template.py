import requests
import json

def fetch_and_save_data(url, filename):
  """
  Fetches data from a REST API and saves it to a file.

  Args:
    url: The URL of the REST API endpoint.
    filename: The name of the file to save the data to.
  """
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes

    with open(filename, 'w', encoding='utf-8') as f:
      json.dump(response.json(), f, indent=4)

    print(f"Data successfully fetched from {url} and saved to {filename}")

  except requests.exceptions.RequestException as e:
    print(f"An error occurred while fetching data: {e}")
  except json.JSONDecodeError as e:
    print(f"An error occurred while parsing the JSON response: {e}")
  except IOError as e:
    print(f"An error occurred while writing to the file: {e}")


if __name__ == "__main__":
  # Example API: JSONPlaceholder, a fake REST API for testing
  api_url = "https://jsonplaceholder.typicode.com/posts/1"
  output_filename = "api_data.json" # Placeholder, will be replaced by main script

  fetch_and_save_data(api_url, output_filename)
