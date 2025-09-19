import random
import string
import os

# Generate a random filename
def generate_random_filename(extension="ts"):
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.{extension}"

# Read the content of our data service
with open("/workspace/my-angular-app/src/app/data.service.ts", "r") as file:
    content = file.read()

# Generate random filename
filename = generate_random_filename("ts")
filepath = f"/workspace/{filename}"

# Save the content to the new file
with open(filepath, "w") as file:
    file.write(content)

print(f"Angular service saved to: {filepath}")