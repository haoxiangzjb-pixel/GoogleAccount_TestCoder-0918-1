import os
import random
import string
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random string of letters and numbers
    random_part = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"macro_{random_part}_{timestamp}.vba"

def copy_macro_to_random_vba():
    """Copy the original macro to a randomly named .vba file"""
    source_file = "format_excel_macro.bas"
    random_filename = generate_random_vba_filename()
    
    # Read the original macro
    with open(source_file, 'r') as src:
        macro_content = src.read()
    
    # Write to the new randomly named file
    with open(random_filename, 'w') as dest:
        dest.write(macro_content)
    
    print(f"VBA macro saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    random_vba_file = copy_macro_to_random_vba()