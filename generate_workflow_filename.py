import random
import string
import os

def generate_random_filename():
    # Generate a random string of 8 lowercase letters
    random_string = ''.join(random.choices(string.ascii_lowercase, k=8))
    filename = f"{random_string}.yml"
    
    # Ensure the file doesn't already exist
    while os.path.exists(f".github/workflows/{filename}"):
        random_string = ''.join(random.choices(string.ascii_lowercase, k=8))
        filename = f"{random_string}.yml"
    
    return filename

if __name__ == "__main__":
    print(generate_random_filename())