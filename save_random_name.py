import random
import string

# Read the content of the OpenCV script
with open('opencv_script_content.py', 'r') as f:
    script_content = f.read()

# Generate a random name for the Python file
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Write the content to the randomly named file
with open(random_name, 'w') as f:
    f.write(script_content)

print(f"OpenCV script saved to randomly named file: {random_name}")