import random
import string
import os
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random string of letters and numbers
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"macro_{random_string}_{timestamp}.vba"

def main():
    # Read the original VBA macro content
    with open('/workspace/format_excel_macro.vba', 'r') as f:
        macro_content = f.read()
    
    # Generate a random filename
    random_filename = generate_random_vba_filename()
    random_filepath = f'/workspace/{random_filename}'
    
    # Write the macro content to the new randomly named file
    with open(random_filepath, 'w') as f:
        f.write(macro_content)
    
    print(f"VBA macro saved to: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    main()