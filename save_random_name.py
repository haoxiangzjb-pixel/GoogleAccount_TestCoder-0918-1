import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_script_to_random_file():
    """Read the API script and save it to a randomly named file"""
    # Read the original API script
    with open('/workspace/api_script.py', 'r') as original_file:
        script_content = original_file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    random_file_path = os.path.join('/workspace', random_filename)
    
    # Write the content to the new randomly named file
    with open(random_file_path, 'w') as random_file:
        random_file.write(script_content)
    
    print(f"Script saved to randomly named file: {random_filename}")
    return random_file_path

if __name__ == "__main__":
    save_script_to_random_file()