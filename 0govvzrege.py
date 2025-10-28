import redis

# Connect to Redis (assumes Redis is running on localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    r.ping()  # Test connection
    print("Connected to Redis successfully!")
except redis.ConnectionError:
    print("Could not connect to Redis. Make sure Redis server is running.")
    exit(1)

# Set a key-value pair in Redis
key = "my_key"
value = "my_value"
r.set(key, value)
print(f"Set key '{{key}}' with value '{{value}}' in Redis")

# Retrieve and print the value to verify
retrieved_value = r.get(key)
print(f"Retrieved value for key '{{key}}': {{retrieved_value}}")
