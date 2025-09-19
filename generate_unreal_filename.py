import random
import string
import sys

def generate_random_filename():
    # Generate a random name for the C++ file
    random_name = ''.join(random.choices(string.ascii_letters, k=10))
    return f"{random_name}.cpp"

if __name__ == "__main__":
    filename = generate_random_filename()
    print(filename)
    # Also write to a file for later retrieval
    with open("generated_filename.txt", "w") as f:
        f.write(filename)