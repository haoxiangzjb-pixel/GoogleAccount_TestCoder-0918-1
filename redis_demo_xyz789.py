#!/usr/bin/env python3
"""
A Python script to demonstrate various Redis operations.
"""

import redis
import random
import string
import time

def generate_random_string(length=10):
    """Generate a random string of specified length."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def main():
    # Connect to Redis server
    try:
        # Connect to Redis (default: localhost:6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
        
        # Set a simple key-value pair
        key1 = f"user:{generate_random_string()}"
        value1 = f"John Doe {random.randint(1, 100)}"
        r.set(key1, value1)
        print(f"Set key '{key1}' with value '{value1}'")
        
        # Set a key with expiration (TTL)
        key2 = f"session:{generate_random_string()}"
        value2 = f"session_data_{generate_random_string(15)}"
        r.setex(key2, 30, value2)  # Expires in 30 seconds
        print(f"Set key '{key2}' with value '{value2}' (expires in 30 seconds)")
        
        # Work with hashes
        user_id = generate_random_string(8)
        hash_key = f"user_profile:{user_id}"
        r.hset(hash_key, "name", "Alice Smith")
        r.hset(hash_key, "email", f"alice{random.randint(1, 1000)}@example.com")
        r.hset(hash_key, "age", random.randint(20, 60))
        print(f"Created hash '{hash_key}' with user profile data")
        
        # Work with lists
        list_key = f"tasks:{generate_random_string()}"
        r.lpush(list_key, "Task 1", "Task 2", "Task 3")
        print(f"Added items to list '{list_key}'")
        
        # Retrieve and display values
        print("\n--- Retrieving Values ---")
        print(f"Value for '{key1}': {r.get(key1)}")
        print(f"Value for '{key2}': {r.get(key2)}")
        print(f"User profile for '{user_id}': {r.hgetall(hash_key)}")
        print(f"Tasks in '{list_key}': {r.lrange(list_key, 0, -1)}")
        
        # Demonstrate TTL
        ttl = r.ttl(key2)
        print(f"TTL for '{key2}': {ttl} seconds")
        
    except redis.ConnectionError:
        print("Error: Could not connect to Redis server. Make sure Redis is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()