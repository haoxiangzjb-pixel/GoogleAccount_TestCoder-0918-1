#!/usr/bin/env python3
"""
A Python script that reads the API call script and saves it to a randomly named .py file.
"""

import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension."""
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_name}.py"

def main():
    # Read the original API script
    with open('/workspace/api_call_script.py', 'r') as original_file:
        content = original_file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    random_filepath = f"/workspace/{random_filename}"
    
    # Write the content to the new file
    with open(random_filepath, 'w') as new_file:
        new_file.write(content)
    
    print(f"API script saved to randomly named file: {random_filepath}")

if __name__ == "__main__":
    main()