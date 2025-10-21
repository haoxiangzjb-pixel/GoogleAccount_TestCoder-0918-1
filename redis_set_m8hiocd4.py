#!/usr/bin/env python3
"""
A Python script that sets a key-value in Redis.
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
        print("Could not connect to Redis server. Make sure Redis is running.")
        return

    # Set a key-value pair
    key = "example_key"
    value = "example_value"
    
    # Set the key-value in Redis
    result = r.set(key, value)
    
    if result:
        print(f"Successfully set key '{key}' with value '{value}'")
    else:
        print(f"Failed to set key '{key}'")
    
    # Verify the value was set
    retrieved_value = r.get(key)
    print(f"Retrieved value for key '{key}': {retrieved_value}")

if __name__ == "__main__":
    main()