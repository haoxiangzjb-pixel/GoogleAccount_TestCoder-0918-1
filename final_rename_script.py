import uuid

# Generate a new filename with a UUID
new_filename = f'/workspace/api_caller_{str(uuid.uuid4())}.py'

# The old filename seems to be '.py' based on 'ls' output
old_filename = '/workspace/.py'

import os
os.rename(old_filename, new_filename)

print(f"File renamed to: {new_filename}")