import cv2
import numpy as np
import os
import sys
from datetime import datetime
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Generate a random filename for the script
    random_script_name = generate_random_filename()
    
    # Create the OpenCV script content
    script_content = '''import cv2
import sys

def main():
    # Load an image from file
    # For this example, we'll look for 'image.jpg' in the current directory
    # You can change this path to any image you want to load
    image_path = input("Enter the path to your image (or press Enter to try 'sample.jpg'): ").strip()
    
    if not image_path:
        image_path = 'sample.jpg'
    
    # Load the image
    image = cv2.imread(image_path)
    
    # Check if image was loaded successfully
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        print("Make sure the file exists and is a valid image format.")
        return
    
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    print("Press any key in the image window to close it and continue...")
    
    # Wait for a key press
    cv2.waitKey(0)
    
    # Close all OpenCV windows
    cv2.destroyAllWindows()
    
    # Optionally save the loaded image with a new name
    save_option = input("Do you want to save the image? (y/n): ").lower()
    if save_option == 'y':
        output_path = input("Enter output filename (e.g., output.jpg): ").strip()
        if not output_path:
            output_path = 'output.jpg'
        
        success = cv2.imwrite(output_path, image)
        if success:
            print(f"Image saved successfully as {output_path}")
        else:
            print("Error saving image")

if __name__ == "__main__":
    main()
'''
    
    # Write the script content to the randomly named file
    with open(random_script_name, 'w') as f:
        f.write(script_content)
    
    print(f"OpenCV script created successfully: {random_script_name}")
    print("The script can load an image, display it, and optionally save it.")
    
    # Also save a copy with the name I generated for reference
    print("\\nTo use this script:")
    print(f"1. Make sure you have an image file in the current directory")
    print(f"2. Run: python {random_script_name}")
    print(f"3. When prompted, enter the path to your image or press Enter to try 'sample.jpg'")

if __name__ == "__main__":
    main()