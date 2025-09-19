import random
import string
import os
import shutil

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Copy the template to the new file
shutil.copy('/workspace/filter_script_template.py', f'/workspace/{random_filename}')

print(f"Script saved to {random_filename}")