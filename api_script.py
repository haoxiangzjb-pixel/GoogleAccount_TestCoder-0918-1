import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def fetch_api_data(url):
    """Fetch data from the given API URL"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

def save_script_to_random_file():
    """Create a script that calls an API and save it to a randomly named .py file"""
    # Create the content of the script that will be saved to the random file
    script_content = '''import requests
import json

def fetch_api_data(url):
    """Fetch data from the given API URL"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

# Example usage
if __name__ == "__main__":
    # Using JSONPlaceholder as an example API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    data = fetch_api_data(api_url)
    
    if data:
        print("Data retrieved from API:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to retrieve data from API")
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Example usage
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    data = fetch_api_data(api_url)
    
    if data:
        print("Data retrieved from API:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to retrieve data from API")
    
    # Save the script to a random file name
    random_file = save_script_to_random_file()
    print(f"Created new script file: {random_file}")