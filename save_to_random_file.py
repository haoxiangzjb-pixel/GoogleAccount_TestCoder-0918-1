import random
import string
import os
import shutil

# Read the selenium test content
with open('/workspace/selenium_google_test.py', 'r') as f:
    content = f.read()

# Generate a random filename
random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
random_filename = f"selenium_test_{random_chars}.py"

# Write the content to the new file
with open(f'/workspace/{random_filename}', 'w') as f:
    f.write(content)

print(f"Saved Selenium test to {random_filename}")