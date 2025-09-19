import redis
import uuid

# Connect to Redis server
r = redis.Redis(host='localhost', port=6379, db=0)

# Generate a random key name
random_key = "key_" + str(uuid.uuid4())

# Set a key-value pair
r.set(random_key, "Hello, Redis!")

# Retrieve and print the value to verify
value = r.get(random_key)
print(f"Set {random_key} = {value.decode('utf-8')}")

# List all keys to show our new key
keys = r.keys('*')
print("All keys in Redis:", [k.decode('utf-8') for k in keys])