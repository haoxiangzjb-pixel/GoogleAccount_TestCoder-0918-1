import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"api_script_{random_chars}.py"

def call_rest_api():
    """Call a REST API and return the response"""
    # Using JSONPlaceholder API for demonstration
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def main():
    # Call the REST API
    data = call_rest_api()
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Save the response to a file
        filename = generate_random_filename()
        with open(filename, 'w') as f:
            f.write("# API Response Data\n")
            f.write(f"data = {json.dumps(data, indent=2)}\n")
            f.write("\n# Print the data\n")
            f.write("print('Data saved from API:')\n")
            f.write("print(data)\n")
        
        print(f"\nData saved to {filename}")
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()