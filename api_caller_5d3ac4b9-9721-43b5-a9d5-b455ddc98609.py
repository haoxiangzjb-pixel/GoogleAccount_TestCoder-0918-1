"""
This script demonstrates how to use the Python Requests library to call a REST API.
It fetches data from a public API and prints the response.
"""

import requests
import json

def main():
    # Example using a public API that returns JSON data
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)
        
        # Parse the JSON response
        data = response.json()
        
        print("API Response:")
        print(json.dumps(data, indent=2))
        
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API call: {e}")
    except json.JSONDecodeError:
        print("Failed to decode JSON response.")

if __name__ == "__main__":
    main()