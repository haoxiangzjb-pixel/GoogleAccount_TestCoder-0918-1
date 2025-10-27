import requests
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def call_rest_api_and_save_script():
    """Call a REST API and save the script with a random name"""
    # Example API call - using JSONPlaceholder API for demonstration
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API call
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Generate a random filename
        random_filename = generate_random_filename()
        
        # Create the content for the new Python script
        script_content = '''# Python script that calls a REST API
import requests

def fetch_data():
    """Fetch data from a REST API"""
    api_url = "''' + api_url + '''"
    
    try:
        response = requests.get(api_url)
        response.raise_for_status()
        
        print("API Response:")
        print(response.json())
        
        # You can process the response data here
        data = response.json()
        print(f"Title: {data.get('title', 'N/A')}")
        print(f"Body: {data.get('body', 'N/A')}")
        
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")

if __name__ == "__main__":
    fetch_data()
'''
        
        # Write the script to the randomly named file
        with open(random_filename, 'w') as file:
            file.write(script_content)
        
        print(f"Successfully created script: {{random_filename}}")
        print(f"API response status: {{response.status_code}}")
        
        # Optionally, print the content of the created file
        print("\\nContent of the created file:")
        print(script_content)
        
        return random_filename
        
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {{e}}")
        return None

if __name__ == "__main__":
    call_rest_api_and_save_script()