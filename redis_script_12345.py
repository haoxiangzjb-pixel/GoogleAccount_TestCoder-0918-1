import redis

# Connect to Redis server
r = redis.Redis(host='localhost', port=6379, db=0)

# Set a key-value pair
r.set('my_key', 'Hello, Redis!')

print("Key 'my_key' has been set to 'Hello, Redis!'")