#!/usr/bin/env python3
"""
A simple script to set a key-value pair in Redis.
Note: Requires Redis server to be installed and running.
"""

import redis
import random
import string

def generate_random_key():
    """Generate a random key for demonstration."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def main():
    print("Attempting to connect to Redis...")
    # Connect to Redis (default: localhost:6379)
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
    except redis.ConnectionError:
        print("Could not connect to Redis.")
        print("Please ensure Redis server is installed and running.")
        print("To install Redis on Ubuntu/Debian: sudo apt update && sudo apt install redis")
        print("To start Redis service: sudo service redis start")
        return
    except Exception as e:
        print(f"An error occurred: {e}")
        print("Please ensure Redis server is installed and running.")
        return

    # Generate a random key and value
    key = generate_random_key()
    value = f"Value for {key}"
    
    # Set the key-value pair
    r.set(key, value)
    print(f"Set key '{key}' with value '{value}'")
    
    # Verify by getting the value
    retrieved_value = r.get(key)
    print(f"Retrieved value for key '{key}': {retrieved_value}")

if __name__ == "__main__":
    main()