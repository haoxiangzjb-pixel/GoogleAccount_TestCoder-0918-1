import os
import random
import string
import shutil

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Generate a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.vba"

def main():
    # Source VBA file
    source_file = "format_excel_sheet.vba"
    source_path = f"/workspace/{source_file}"
    
    # Generate random filename
    random_filename = generate_random_vba_filename()
    random_path = f"/workspace/{random_filename}"
    
    # Copy the source file to the random filename
    shutil.copy(source_path, random_path)
    
    print(f"VBA macro saved to randomly named file: {random_filename}")
    print(f"Original file: {source_file}")

if __name__ == "__main__":
    main()