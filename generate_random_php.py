import random
import string
import os

# Generate a random string of 10 characters
random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))

# Create the new filename with .php extension
new_filename = f"{random_string}.php"

# Read the content from the original file
with open('/workspace/mysql_connection.php', 'r') as original_file:
    content = original_file.read()

# Write the content to the new file
with open(f'/workspace/{new_filename}', 'w') as new_file:
    new_file.write(content)

print(f"File saved as: {new_filename}")