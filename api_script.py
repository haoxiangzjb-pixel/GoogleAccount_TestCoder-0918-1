import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and save the response to a randomly named .py file
    """
    # Using JSONPlaceholder API as an example
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(api_url)
        
        # Check if the request was successful
        if response.status_code == 200:
            # Parse the JSON response
            data = response.json()
            
            # Generate a random filename with .py extension
            random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
            
            # Save the response data to the randomly named file
            with open(random_filename, 'w') as file:
                file.write(f"# API Response saved from {api_url}\n")
                file.write("api_response = ")
                file.write(json.dumps(data, indent=2))
            
            print(f"API response saved to {random_filename}")
            return random_filename
        else:
            print(f"Error: Received status code {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the request: {e}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return None

if __name__ == "__main__":
    call_rest_api()