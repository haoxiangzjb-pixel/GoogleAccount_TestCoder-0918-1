import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"{random_chars}.py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling REST API: {api_url}")
    data = call_rest_api(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Generate a random filename
        filename = generate_random_filename()
        print(f"\nSaving script to: {filename}")
        
        # Save the API response to the randomly named file
        with open(filename, 'w') as f:
            f.write("# API Response Data\n")
            f.write(f"data = {json.dumps(data, indent=2)}\n")
            f.write("\n# You can access the data using the 'data' variable\n")
            f.write("print('Data saved successfully!')\n")
            f.write("print(f'Title: {data[\"title\"]}')\n")
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()