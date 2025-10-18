import os
import random
import string
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random string of letters and numbers
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    # Create filename with timestamp for uniqueness
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"macro_{random_string}_{timestamp}.vba"

def copy_macro_to_random_file(source_file, dest_dir="/workspace"):
    """Copy the VBA macro to a randomly named file"""
    # Read the source macro file
    with open(source_file, 'r') as src:
        macro_content = src.read()
    
    # Generate random filename
    random_filename = generate_random_vba_filename()
    dest_path = os.path.join(dest_dir, random_filename)
    
    # Write macro content to the new random filename
    with open(dest_path, 'w') as dest:
        dest.write(macro_content)
    
    print(f"VBA macro copied to: {dest_path}")
    return dest_path

# Main execution
if __name__ == "__main__":
    source_file = "/workspace/format_excel_macro.vba"
    if os.path.exists(source_file):
        random_vba_file = copy_macro_to_random_file(source_file)
        print(f"Successfully created randomly named VBA file: {random_vba_file}")
    else:
        print(f"Source file {source_file} does not exist!")