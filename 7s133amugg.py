import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a demo REST API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(api_url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API call: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    # Call the REST API
    api_data = call_rest_api()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save this script to a file with the random name
    with open(__file__, 'r') as source_file:
        script_content = source_file.read()
    
    with open(random_filename, 'w') as output_file:
        output_file.write(script_content)
    
    print(f"\nThis script has been saved to: {random_filename}")