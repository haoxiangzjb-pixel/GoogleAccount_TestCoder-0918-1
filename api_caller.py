import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"api_script_{random_chars}.py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_script_to_file(filename):
    """Save a sample API calling script to a file"""
    script_content = '''
import requests
import json

def call_api():
    """Call a public API and print the response"""
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
        print("API Response:")
        print(json.dumps(data, indent=2))
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")

if __name__ == "__main__":
    call_api()
'''
    
    with open(filename, 'w') as file:
        file.write(script_content)
    
    print(f"Script saved to {filename}")

def main():
    # Generate a random filename
    filename = generate_random_filename()
    
    # Save the script
    save_script_to_file(filename)
    
    # Optionally, you can execute the script here
    # import subprocess
    # subprocess.run(['python', filename])

if __name__ == "__main__":
    main()