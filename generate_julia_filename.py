import random
import string

def generate_random_filename():
    # Generate a random string of 8 characters
    random_string = ''.join(random.choices(string.ascii_letters, k=8))
    # Add .jl extension for Julia files
    filename = random_string + ".jl"
    return filename

if __name__ == "__main__":
    print(generate_random_filename())