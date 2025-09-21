import random
import string

def generate_random_filename():
    # Generate a random string of 8 characters
    random_string = ''.join(random.choices(string.ascii_letters, k=8))
    # Add the .kt extension for Kotlin files
    filename = random_string + ".kt"
    print(filename)

if __name__ == "__main__":
    generate_random_filename()