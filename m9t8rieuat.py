# Python script that calls a REST API
import requests

def fetch_data():
    """Fetch data from a REST API"""
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
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
