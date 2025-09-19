import random
import string

def generate_random_filename():
    # Generate a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_lowercase, k=10))
    # Add the .ts extension for TypeScript files
    filename = f"{random_string}.ts"
    return filename

if __name__ == "__main__":
    print(generate_random_filename())