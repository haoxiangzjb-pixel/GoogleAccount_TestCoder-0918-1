#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API.
This script fetches data from a public API and prints the response.
"""

import requests
import json
import sys


def fetch_api_data(url):
    """
    Fetch data from the specified API URL.
    
    Args:
        url (str): The API endpoint to call
        
    Returns:
        dict: The JSON response from the API
    """
    try:
        print(f"Making GET request to: {url}")
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        # Parse the JSON response
        data = response.json()
        
        print("API call successful!")
        return data
    except requests.exceptions.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")
        sys.exit(1)
    except requests.exceptions.ConnectionError as conn_err:
        print(f"Connection error occurred: {conn_err}")
        sys.exit(1)
    except requests.exceptions.Timeout as timeout_err:
        print(f"Timeout error occurred: {timeout_err}")
        sys.exit(1)
    except requests.exceptions.RequestException as req_err:
        print(f"An error occurred: {req_err}")
        sys.exit(1)
    except json.JSONDecodeError as json_err:
        print(f"Error decoding JSON response: {json_err}")
        sys.exit(1)


def main():
    # Using JSONPlaceholder, a free testing API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    # Fetch data from the API
    data = fetch_api_data(api_url)
    
    # Print the response nicely formatted
    print("\nAPI Response:")
    print(json.dumps(data, indent=2))


if __name__ == "__main__":
    main()