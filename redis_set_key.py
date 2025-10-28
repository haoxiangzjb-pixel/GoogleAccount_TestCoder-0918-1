import redis
import random
import string

# Generate a random filename for the script
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Connect to Redis (assumes Redis is running on localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    r.ping()  # Test connection
    print("Connected to Redis successfully!")
except redis.ConnectionError:
    print("Could not connect to Redis. Make sure Redis server is running.")
    exit(1)

# Set a key-value pair in Redis
key = "example_key"
value = "example_value"
r.set(key, value)
print(f"Set key '{key}' with value '{value}' in Redis")

# Create the Python script content that sets a key-value in Redis
script_content = '''import redis

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
'''

# Generate random filename and save the script
random_filename = generate_random_filename()
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Python script saved to {random_filename}")