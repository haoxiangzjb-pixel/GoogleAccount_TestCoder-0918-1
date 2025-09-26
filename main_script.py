import os
import random
import string
import api_script_template

def generate_random_filename(extension=".py", length=10):
    """Generates a random filename with a given extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=length))
    return f"{random_string}{extension}"

# Generate a random filename for the new script
random_script_name = generate_random_filename()

# Read the content of the template script
with open('/workspace/api_script_template.py', 'r') as f:
    template_content = f.read()

# Modify the script content to use the random name for its own output file
# Replace the placeholder filename in the template content
modified_content = template_content.replace('output_filename = "api_data.json"', f'output_filename = "{random_script_name.replace(".py", ".json")}"')

# Write the modified content to the new randomly named file
with open(random_script_name, 'w') as f:
    f.write(modified_content)

print(f"Python script created: {random_script_name}")

# Execute the newly created script
exec(open(random_script_name).read())
