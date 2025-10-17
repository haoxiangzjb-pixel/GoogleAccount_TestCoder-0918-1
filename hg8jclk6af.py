import requests
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
