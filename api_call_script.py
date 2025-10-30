#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and display the response.
"""

import requests
import json

def call_rest_api(url):
    """
    Makes a GET request to the specified URL and returns the response.
    
    Args:
        url (str): The API endpoint to call
    
    Returns:
        dict: The JSON response from the API
    """
    try:
        # Make the GET request
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        # Parse the JSON response
        data = response.json()
        
        return data
        
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON response: {e}")
        return None

def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Making API call to: {api_url}")
    
    # Call the API
    result = call_rest_api(api_url)
    
    if result:
        print("API Response:")
        print(json.dumps(result, indent=2))
    else:
        print("Failed to retrieve data from the API")

if __name__ == "__main__":
    main()