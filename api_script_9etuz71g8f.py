
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
