import random
import string
import os
import shutil

def generate_random_filename(extension=".cpp"):
    """Generates a random filename with the specified extension."""
    # Generate a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_string + extension

def main():
    # Source file path
    source_file = "/workspace/max_element_finder.cpp"
    
    # Generate a random filename
    random_filename = generate_random_filename()
    destination_file = f"/workspace/{random_filename}"
    
    # Copy the file with the new random name
    shutil.copy(source_file, destination_file)
    
    print(f"File saved as: {destination_file}")

if __name__ == "__main__":
    main()