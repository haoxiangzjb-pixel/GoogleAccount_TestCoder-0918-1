import random
import string
import sys

def generate_random_scala_filename():
    # Generate a random filename with .scala extension
    filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.scala'
    return filename

if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "print_only":
        # Just print the filename without creating a file
        print(generate_random_scala_filename())
    else:
        # Generate and print the filename
        filename = generate_random_scala_filename()
        print(f"Generated random filename: {filename}")