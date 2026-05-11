import requests

def call_api(url, method='GET', headers=None, params=None, data=None):
    """
    Call a REST API endpoint using the requests library.
    
    Args:
        url (str): The API endpoint URL
        method (str): HTTP method (GET, POST, PUT, DELETE, etc.)
        headers (dict): Optional HTTP headers
        params (dict): Optional query parameters
        data (dict): Optional request body data
    
    Returns:
        dict: JSON response from the API
    """
    try:
        response = requests.request(
            method=method,
            url=url,
            headers=headers,
            params=params,
            json=data
        )
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"API request failed: {e}")
        return None

if __name__ == "__main__":
    # Example usage with JSONPlaceholder API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    result = call_api(api_url)
    
    if result:
        print("API Response:")
        print(result)
