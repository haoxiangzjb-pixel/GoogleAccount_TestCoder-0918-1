import redis

# Connect to Redis (assumes Redis is running on localhost:6379)
r = redis.Redis(host='localhost', port=6379, db=0)

# Set a key-value pair
key = "my_key"
value = "my_value"
r.set(key, value)

print(f"Set {key} = {value}")