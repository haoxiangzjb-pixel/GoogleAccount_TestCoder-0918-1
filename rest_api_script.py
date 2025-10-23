#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and demonstrates how to handle the response.
"""

import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and return the response
    """
    # Using JSONPlaceholder API as an example of a free REST API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(api_url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("Successfully called the REST API!")
            print("Status Code:", response.status_code)
            
            # Parse the JSON response
            data = response.json()
            print("Response Data:")
            print(json.dumps(data, indent=2))
            
            return data
        else:
            print(f"Failed to call API. Status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    """
    Main function to execute the script
    """
    print("Calling REST API using Requests library...")
    
    # Call the REST API
    api_data = call_rest_api()
    
    if api_data:
        # Generate a random filename
        random_filename = generate_random_filename()
        print(f"\nSaving this script to a randomly named file: {random_filename}")
        
        # Read the current script content
        with open(__file__, 'r') as original_file:
            script_content = original_file.read()
        
        # Write the script content to the new random filename
        with open(random_filename, 'w') as new_file:
            new_file.write(script_content)
        
        print(f"Script successfully saved as {random_filename}")

if __name__ == "__main__":
    main()