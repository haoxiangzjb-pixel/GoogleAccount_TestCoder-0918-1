#!/usr/bin/env python3
"""
Script to save the API script with a random filename.
"""

import random
import string
import os


def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"


def main():
    # Read the content of the API script
    with open('/workspace/api_script.py', 'r') as source_file:
        script_content = source_file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename(".py")
    random_filepath = f"/workspace/{random_filename}"
    
    # Write the content to the new file with random name
    with open(random_filepath, 'w') as dest_file:
        dest_file.write(script_content)
    
    print(f"API script saved to: {random_filepath}")


if __name__ == "__main__":
    main()