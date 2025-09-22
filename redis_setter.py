#!/usr/bin/env python3
"""
Redis Key-Value Setter Script
This script demonstrates how to connect to a Redis server and set a key-value pair.
"""

import redis
import random
import string
import sys

def generate_random_key():
    """Generate a random key for demonstration."""
    return 'key_' + ''.join(random.choices(string.ascii_letters + string.digits, k=8))

def generate_random_value():
    """Generate a random value for demonstration."""
    return 'value_' + ''.join(random.choices(string.ascii_letters + string.digits, k=12))

def main():
    # Connect to Redis server
    try:
        # Connect to Redis server (default: localhost:6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Test the connection
        r.ping()
        print("Connected to Redis server successfully!")
        
        # Generate random key-value pair
        key = generate_random_key()
        value = generate_random_value()
        
        # Set the key-value pair in Redis
        r.set(key, value)
        print(f"Set key '{key}' with value '{value}'")
        
        # Verify by getting the value
        retrieved_value = r.get(key)
        print(f"Retrieved value for key '{key}': {retrieved_value}")
        
        # Additional example with expiration time (5 minutes)
        temp_key = "temporary_key"
        temp_value = "This will expire in 5 minutes"
        r.setex(temp_key, 300, temp_value)  # 300 seconds = 5 minutes
        print(f"Set temporary key '{temp_key}' with 5-minute expiration")
        
    except redis.ConnectionError:
        print("Error: Could not connect to Redis server.")
        print("Please ensure Redis server is running on localhost:6379")
        print("You can install Redis server with:")
        print("  - Ubuntu/Debian: sudo apt-get install redis-server")
        print("  - CentOS/RHEL: sudo yum install redis")
        print("  - macOS: brew install redis")
        return 1
    except Exception as e:
        print(f"An error occurred: {e}")
        return 1
    
    return 0

if __name__ == "__main__":
    sys.exit(main())