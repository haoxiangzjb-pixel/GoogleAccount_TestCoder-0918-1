import requests
import json

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API endpoint
OUTPUT_FILE = "api_response.json"  # File to save the response

def fetch_and_save_data():
    """Fetches data from the API and saves it to a file."""
    try:
        # Make the GET request
        response = requests.get(API_URL)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Parse the JSON response
        data = response.json()

        # Save the data to a file
        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4)

        print(f"Data successfully fetched and saved to {OUTPUT_FILE}")
        print(json.dumps(data, indent=2)) # Print the data as well

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the request: {e}")
    except json.JSONDecodeError as e:
        print(f"An error occurred while parsing the response: {e}")
    except IOError as e:
        print(f"An error occurred while writing to the file: {e}")

if __name__ == "__main__":
    fetch_and_save_data()
