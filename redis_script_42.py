#!/usr/bin/env python3
"""
A simple Python script to connect to Redis and set a key-value pair.
"""

import redis
import random
import string

def generate_random_key():
    """Generate a random key for demonstration."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def generate_random_value():
    """Generate a random value for demonstration."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=20))

def main():
    # Connect to Redis (assuming it's running on localhost:6379)
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Generate random key and value
        key = generate_random_key()
        value = generate_random_value()
        
        # Set the key-value pair in Redis
        r.set(key, value)
        
        print(f"Successfully set key '{key}' with value '{value}' in Redis")
        
        # Verify by getting the value back
        retrieved_value = r.get(key)
        print(f"Retrieved value for key '{key}': {retrieved_value}")
        
    except redis.ConnectionError:
        print("Error: Unable to connect to Redis. Please ensure Redis is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()