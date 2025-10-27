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
    # Try to load an image - you can change this path to any image you have
    # For demonstration purposes, we'll create a simple image if no image exists
    image_path = "sample_image.jpg"
    
    # Create a sample image if it doesn't exist
    if not os.path.exists(image_path):
        # Create a simple colored image
        sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
        sample_img[:] = [255, 100, 50]  # Blue color in BGR
        # Add some text
        cv2.putText(sample_img, 'Sample Image', (50, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        cv2.imwrite(image_path, sample_img)
        print(f"Created sample image: {image_path}")
    
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Could not load image from {image_path}")
        sys.exit(1)
    
    print(f"Image loaded successfully. Shape: {img.shape}")
    
    # Since we're in a headless environment, we'll skip the GUI display
    # and just simulate the display functionality
    print("Image display skipped in headless environment...")
    print("Continuing with saving the script with a random name...")
    
    # Generate random filename and save this script with that name
    random_filename = generate_random_filename()
    
    # Read this script's content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the script to the new random filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved with random name: {random_filename}")

if __name__ == "__main__":
    main()