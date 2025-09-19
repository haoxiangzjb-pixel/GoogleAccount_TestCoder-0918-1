#!/usr/bin/env python3
import random
import string

def generate_random_filename():
    # Generate a random string of 8 characters
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    filename = f"{random_string}_restart_service.yml"
    return filename

if __name__ == "__main__":
    print(generate_random_filename())