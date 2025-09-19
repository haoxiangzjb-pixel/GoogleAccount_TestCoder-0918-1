import random
import string

def generate_random_filename():
    # Generate a random string of 8 characters
    random_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"{random_str}_model.py"

if __name__ == "__main__":
    filename = generate_random_filename()
    print(filename)