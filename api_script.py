#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and demonstrates how to handle the response.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def call_rest_api(url):
    """
    Make a GET request to the specified URL and return the response
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error occurred while making API request: {e}")
        return None

def save_data_to_random_file(data):
    """
    Save the provided data to a randomly named .py file
    """
    random_filename = generate_random_filename()
    
    try:
        with open(random_filename, 'w') as file:
            file.write("# Generated file with API response data\n\n")
            file.write("api_response = ")
            file.write(json.dumps(data, indent=2))
            file.write("\n")
        print(f"Data saved to {random_filename}")
        return random_filename
    except IOError as e:
        print(f"Error occurred while saving file: {e}")
        return None

def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print("Making API request to:", api_url)
    api_data = call_rest_api(api_url)
    
    if api_data:
        print("API request successful!")
        print("Sample data:", json.dumps(api_data, indent=2)[:200] + "...")
        
        # Save the API response to a randomly named .py file
        saved_filename = save_data_to_random_file(api_data)
        if saved_filename:
            print(f"Successfully saved API response to {saved_filename}")
        else:
            print("Failed to save the API response to a file")
    else:
        print("Failed to get API response")

if __name__ == "__main__":
    main()