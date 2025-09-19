#!/usr/bin/env python3
"""
A simple Python script to connect to Redis and set a key-value pair.
"""

import redis
import random
import string

def generate_random_key():
    """Generate a random key for demonstration."""
    return ''.join(random.choices(string.ascii_letters, k=10))

def main():
    # Connect to Redis server (default: localhost:6379)
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
        
        # Generate a random key and value
        key = generate_random_key()
        value = "Hello, Redis!"
        
        # Set the key-value pair
        r.set(key, value)
        print(f"Set key '{key}' with value '{value}'")
        
        # Retrieve and print the value to verify
        retrieved_value = r.get(key)
        print(f"Retrieved value for key '{key}': {retrieved_value}")
        
    except redis.ConnectionError:
        print("Error: Could not connect to Redis server. Please ensure Redis is installed and running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()