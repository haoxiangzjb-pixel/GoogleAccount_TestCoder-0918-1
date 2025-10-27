import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_script_to_random_file():
    """Save the API script to a randomly named .py file"""
    # Read the content of the API script
    with open('/workspace/api_script.py', 'r') as f:
        script_content = f.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    random_filepath = f"/workspace/{random_filename}"
    
    # Write the content to the randomly named file
    with open(random_filepath, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to randomly named file: {random_filename}")
    return random_filepath

if __name__ == "__main__":
    save_script_to_random_file()