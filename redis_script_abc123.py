import redis
import random
import string

# Connect to Redis server (assumes default localhost:6379)
r = redis.Redis(decode_responses=True)

# Generate a random key name
random_key = ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Define the value to store
value_to_store = "Hello, Redis!"

# Set the key-value pair in Redis
r.set(random_key, value_to_store)

print(f"Set key '{random_key}' with value '{value_to_store}' in Redis.")