import random
import string
import os
import shutil

def generate_random_name(length=8):
    """Generate a random string of specified length"""
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for i in range(length))

def main():
    # Original file
    source_file = "SumFunction.bas"
    
    # Generate random filename
    random_name = generate_random_name()
    destination_file = f"{random_name}.bas"
    
    # Copy file with new name
    shutil.copy2(source_file, destination_file)
    
    print(f"VBA function saved to file: {destination_file}")

if __name__ == "__main__":
    main()