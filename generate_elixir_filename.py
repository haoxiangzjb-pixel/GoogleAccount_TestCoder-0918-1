import random
import string

def generate_random_filename():
    # Generate a random string of 10 lowercase letters
    random_string = ''.join(random.choices(string.ascii_lowercase, k=10))
    # Add the .ex extension for Elixir files
    filename = random_string + ".ex"
    print(filename)

generate_random_filename()