import requests
import random
import string

def call_rest_api(url="https://jsonplaceholder.typicode.com/posts/1"):
    """
    Calls a REST API and returns the response
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error occurred while calling the API: {e}")
        return None

def save_script_to_random_file():
    """
    Saves this script to a randomly named .py file
    """
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write to the new random file
    with open(random_name, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_name}")
    return random_name

if __name__ == "__main__":
    # Call the API
    data = call_rest_api()
    if data:
        print("API Response:")
        print(data)
    
    # Save this script to a randomly named file
    save_script_to_random_file()