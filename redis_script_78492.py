import redis
import random
import string

def generate_random_key():
    """Generate a random string for use as a Redis key"""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def generate_random_value():
    """Generate a random string for use as a Redis value"""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=20))

def main():
    # Connect to Redis (assuming it's running on localhost:6379)
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Generate a random key-value pair
        key = generate_random_key()
        value = generate_random_value()
        
        # Set the key-value in Redis
        r.set(key, value)
        
        # Verify it was set correctly
        retrieved_value = r.get(key)
        
        print(f"Set key: {key}")
        print(f"Set value: {value}")
        print(f"Retrieved value: {retrieved_value}")
        
        if value == retrieved_value:
            print("Success! Key-value pair was set correctly.")
        else:
            print("Error! Key-value pair was not set correctly.")
            
    except Exception as e:
        print(f"Error connecting to Redis: {e}")

if __name__ == "__main__":
    main()