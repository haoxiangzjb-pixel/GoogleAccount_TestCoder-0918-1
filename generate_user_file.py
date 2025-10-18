import json
import random
import time

class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Create a user instance
user = User("Alice", 30)

# Generate a random filename using current timestamp and random number
timestamp = int(time.time())
random_suffix = random.randint(1000, 9999)
filename = f"user_data_{timestamp}_{random_suffix}.json"

# Serialize user data to JSON
user_data = {
    "name": user.name,
    "age": user.age
}

# Write to file
with open(filename, 'w') as file:
    json.dump(user_data, file)

print(f"User data saved to file: {filename}")