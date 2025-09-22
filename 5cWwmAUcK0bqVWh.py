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

def save_response_to_file(data, filename):
    """Save API response to a JSON file"""
    try:
        with open(filename, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"Response saved to {filename}")
    except Exception as e:
        print(f"Error saving to file: {e}")

def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling REST API: {api_url}")
    data = call_rest_api(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Generate a random filename and save the response
        filename = generate_random_filename()
        save_response_to_file(data, filename)
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()