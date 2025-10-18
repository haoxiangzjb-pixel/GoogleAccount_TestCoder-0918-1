import random
import string
import os

# Read the original schema
with open('/workspace/schema.graphql', 'r') as f:
    schema_content = f.read()

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
random_filename = f"/workspace/{random_name}.graphql"

# Write the schema to the random filename
with open(random_filename, 'w') as f:
    f.write(schema_content)

print(f"Schema saved to: {random_filename}")