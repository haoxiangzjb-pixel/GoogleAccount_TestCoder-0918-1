import requests

# Automatically generated script to call a REST API
API_ENDPOINT = "https://jsonplaceholder.typicode.com/posts/1"

def main():
    try:
        response = requests.get(API_ENDPOINT)
        response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)

        print("Status Code:", response.status_code)
        print("Response Headers:", response.headers)
        print("\nResponse JSON:")
        print(response.json())

    except requests.exceptions.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")
    except requests.exceptions.ConnectionError as conn_err:
        print(f"Connection error occurred: {conn_err}")
    except requests.exceptions.Timeout as timeout_err:
        print(f"Timeout error occurred: {timeout_err}")
    except requests.exceptions.RequestException as req_err:
        print(f"An error occurred: {req_err}")
    except ValueError as json_err: # Catch errors in .json() parsing
        print(f"JSON decode error: {json_err}")
        print("Response Text (for debugging):", response.text)

if __name__ == "__main__":
    main()
