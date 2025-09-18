#!/usr/bin/env python3
"""
A simple Python script that connects to Redis and sets a key-value pair.
If Redis server is not available, it will use an in-memory dictionary as fallback.
"""

import sys

class MockRedis:
    """A mock Redis class for demonstration when Redis server is not available."""
    def __init__(self):
        self._data = {}
    
    def ping(self):
        return True
    
    def set(self, key, value):
        self._data[key] = value
        return True
    
    def get(self, key):
        return self._data.get(key)

def main():
    try:
        # Try to import and connect to Redis
        import redis
        try:
            r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
            r.ping()
            print("Connected to Redis server successfully!")
        except redis.ConnectionError:
            print("Redis server not available, using mock implementation.")
            r = MockRedis()
    except ImportError:
        print("Redis library not installed, using mock implementation.")
        r = MockRedis()
    
    # Set a key-value pair
    key = "example_key"
    value = "example_value"
    
    r.set(key, value)
    print(f"Set key '{key}' with value '{value}'")
    
    # Verify by getting the value
    retrieved_value = r.get(key)
    print(f"Retrieved value for '{key}': {retrieved_value}")

if __name__ == "__main__":
    main()