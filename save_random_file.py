import random
import string
import os

# Read the template file
with open('/workspace/mysql_query_template.py', 'r') as f:
    content = f.read()

# Generate random filename
random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
filename = f"mysql_query_{random_chars}.py"

# Write to new file with random name
with open(f'/workspace/{filename}', 'w') as f:
    f.write(content)

print(f"Python script saved as: {filename}")