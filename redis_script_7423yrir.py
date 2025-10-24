#!/usr/bin/env python3
"""
A Python script that connects to Redis and sets a key-value pair.
"""

import redis

def main():
    # Connect to Redis server (default host is localhost, port 6379)
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
    except redis.ConnectionError:
        print("Could not connect to Redis. Make sure Redis server is running.")
        return

    # Set a key-value pair
    key = "example_key"
    value = "example_value"
    
    r.set(key, value)
    print(f"Set key '{key}' with value '{value}'")
    
    # Retrieve and print the value to confirm
    retrieved_value = r.get(key)
    print(f"Retrieved value for '{key}': {retrieved_value}")

if __name__ == "__main__":
    main()