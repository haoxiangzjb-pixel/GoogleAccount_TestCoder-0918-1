#!/usr/bin/env python3
"""
REST API Client using Requests library

This script demonstrates how to call a REST API using the Requests library.
It includes examples for GET, POST, PUT, and DELETE requests with error handling.
"""

import requests
import json
from typing import Optional, Dict, Any


def call_api(
    url: str,
    method: str = "GET",
    headers: Optional[Dict[str, str]] = None,
    params: Optional[Dict[str, Any]] = None,
    data: Optional[Dict[str, Any]] = None,
    json_data: Optional[Dict[str, Any]] = None,
    timeout: int = 10
) -> Dict[str, Any]:
    """
    Make a REST API call using the Requests library.
    
    Args:
        url: The API endpoint URL
        method: HTTP method (GET, POST, PUT, DELETE, PATCH)
        headers: Optional dictionary of HTTP headers
        params: Optional dictionary of query parameters
        data: Optional dictionary for form-encoded data
        json_data: Optional dictionary for JSON body data
        timeout: Request timeout in seconds
    
    Returns:
        Dictionary containing status_code, headers, and response data
    """
    try:
        response = requests.request(
            method=method.upper(),
            url=url,
            headers=headers,
            params=params,
            data=data,
            json=json_data,
            timeout=timeout
        )
        
        # Try to parse response as JSON
        try:
            response_data = response.json()
        except json.JSONDecodeError:
            response_data = response.text
        
        return {
            "status_code": response.status_code,
            "headers": dict(response.headers),
            "data": response_data,
            "success": response.ok
        }
    
    except requests.exceptions.Timeout:
        return {
            "status_code": None,
            "error": "Request timed out",
            "success": False
        }
    except requests.exceptions.ConnectionError:
        return {
            "status_code": None,
            "error": "Connection error",
            "success": False
        }
    except requests.exceptions.RequestException as e:
        return {
            "status_code": None,
            "error": str(e),
            "success": False
        }


def main():
    """Example usage of the API client."""
    
    # Example 1: GET request to JSONPlaceholder API
    print("Example 1: GET request")
    print("-" * 40)
    
    get_url = "https://jsonplaceholder.typicode.com/posts/1"
    result = call_api(get_url, method="GET")
    
    if result["success"]:
        print(f"Status Code: {result['status_code']}")
        print(f"Response Data: {json.dumps(result['data'], indent=2)}")
    else:
        print(f"Error: {result.get('error', 'Unknown error')}")
    
    print("\n")
    
    # Example 2: POST request to create a new resource
    print("Example 2: POST request")
    print("-" * 40)
    
    post_url = "https://jsonplaceholder.typicode.com/posts"
    post_data = {
        "title": "My New Post",
        "body": "This is the content of my post.",
        "userId": 1
    }
    
    result = call_api(
        post_url,
        method="POST",
        json_data=post_data,
        headers={"Content-Type": "application/json"}
    )
    
    if result["success"]:
        print(f"Status Code: {result['status_code']}")
        print(f"Response Data: {json.dumps(result['data'], indent=2)}")
    else:
        print(f"Error: {result.get('error', 'Unknown error')}")
    
    print("\n")
    
    # Example 3: GET request with query parameters
    print("Example 3: GET request with parameters")
    print("-" * 40)
    
    params_url = "https://jsonplaceholder.typicode.com/posts"
    params = {"userId": 1, "_limit": 3}
    
    result = call_api(params_url, method="GET", params=params)
    
    if result["success"]:
        print(f"Status Code: {result['status_code']}")
        print(f"Response Data: {json.dumps(result['data'], indent=2)}")
    else:
        print(f"Error: {result.get('error', 'Unknown error')}")


if __name__ == "__main__":
    main()
