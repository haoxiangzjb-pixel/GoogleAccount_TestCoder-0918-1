import requests
import json
import random
import string

def call_rest_api():
    """
    Calls a REST API and prints the response
    """
    # Using JSONPlaceholder as a sample API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an exception for bad status codes
        
        print("API Response:")
        print(json.dumps(response.json(), indent=2))
        
        return response.json()
        
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None

if __name__ == "__main__":
    call_rest_api()