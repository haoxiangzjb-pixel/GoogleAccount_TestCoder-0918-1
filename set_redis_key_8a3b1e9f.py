import redis
import uuid

# Generate a random key
random_key = str(uuid.uuid4())

# The value to store
value = "Hello, Redis!"

# Connect to Redis (assumes Redis is running locally on default port 6379)
r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)

# Set the key-value pair in Redis
r.set(random_key, value)

print(f"Set key '{random_key}' with value '{value}' in Redis.")