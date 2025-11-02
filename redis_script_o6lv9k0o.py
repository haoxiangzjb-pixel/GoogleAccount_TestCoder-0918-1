import redis
import sys

def set_redis_key_value():
    """
    Connects to Redis and sets a key-value pair.
    """
    try:
        # Connect to Redis (default host is localhost, port 6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Set a key-value pair
        key = "example_key"
        value = "example_value"
        
        result = r.set(key, value)
        
        if result:
            print(f"Successfully set key '{key}' with value '{value}'")
            
            # Verify the value was set
            retrieved_value = r.get(key)
            print(f"Retrieved value for key '{key}': {retrieved_value}")
        else:
            print(f"Failed to set key '{key}'")
            
    except redis.ConnectionError:
        print("Could not connect to Redis server. Please make sure Redis is running.")
        return False
    except Exception as e:
        print(f"An error occurred: {e}")
        return False
    
    return True

if __name__ == "__main__":
    print("Attempting to set a key-value in Redis...")
    success = set_redis_key_value()
    
    if success:
        print("Redis operation completed successfully!")
    else:
        print("Redis operation failed!")
        sys.exit(1)