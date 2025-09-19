#!/usr/bin/env python3
"""
A simple Python script to connect to Redis and set a key-value pair.
"""

import redis
import random
import string

def generate_random_key():
    """Generate a random key for Redis."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def generate_random_value():
    """Generate a random value for Redis."""
    return ''.join(random.choices(string.ascii_letters + string.digits + ' ', k=20))

def main():
    # Connect to Redis server
    try:
        # Connect to Redis (default: localhost:6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
        
        # Generate random key-value pair
        key = generate_random_key()
        value = generate_random_value()
        
        # Set the key-value pair in Redis
        r.set(key, value)
        print(f"Set key '{key}' with value '{value}'")
        
        # Verify by getting the value
        retrieved_value = r.get(key)
        print(f"Retrieved value for key '{key}': '{retrieved_value}'")
        
    except redis.ConnectionError:
        print("Error: Could not connect to Redis server. Make sure Redis is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()