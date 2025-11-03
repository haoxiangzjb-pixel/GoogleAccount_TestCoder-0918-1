import os
import random
import string
import shutil

def generate_random_filename(extension=".vba"):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_name + extension

def copy_macro_to_random_vba():
    """Copy the VBA macro to a randomly named .vba file."""
    # Source file
    source_file = "format_excel_macro.bas"
    
    # Generate random filename
    random_filename = generate_random_filename(".vba")
    
    # Copy the file with the new random name
    shutil.copy(source_file, random_filename)
    
    print(f"VBA macro saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    copy_macro_to_random_vba()