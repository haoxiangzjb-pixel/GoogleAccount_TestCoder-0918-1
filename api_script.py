import requests
import random
import string
import os

def call_rest_api():
    """
    Calls a REST API and saves the response to a randomly named .py file
    """
    # Using JSONPlaceholder as a sample API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API call
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Generate a random filename with .py extension
        random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
        
        # Save the response to the randomly named file
        with open(random_filename, 'w') as file:
            file.write(f"# API Response saved from {api_url}\n")
            file.write(f"status_code = {response.status_code}\n")
            file.write(f"response_data = {response.json()}\n")
        
        print(f"API call successful. Response saved to {random_filename}")
        return random_filename
        
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None
    except Exception as e:
        print(f"Error saving file: {e}")
        return None

if __name__ == "__main__":
    call_rest_api()