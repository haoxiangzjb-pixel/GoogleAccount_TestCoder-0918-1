#!/usr/bin/env python3
"""
A Python script that demonstrates how to call a REST API using the Requests library.
This script calls a public API and saves the response to a file.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def call_rest_api():
    """Call a REST API and save the response to a randomly named file."""
    # Using JSONPlaceholder as an example API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API request
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Get the data from the response
        data = response.json()
        
        # Generate a random filename
        random_filename = generate_random_filename()
        
        # Save the response data to the randomly named file
        with open(random_filename, 'w') as file:
            json.dump(data, file, indent=2)
        
        print(f"API response saved to: {random_filename}")
        print(f"Response data: {json.dumps(data, indent=2)}")
        
        return random_filename
        
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    call_rest_api()