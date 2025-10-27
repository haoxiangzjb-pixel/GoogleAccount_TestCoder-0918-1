import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension='.png'):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_name + extension

def main():
    # Load an image (using the test image we created)
    image_path = 'test_image.png'
    
    if not os.path.exists(image_path):
        print(f"Image {image_path} not found!")
        return
    
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully. Shape: {img.shape}")
    
    # Skip displaying in headless environment
    print("Image loaded (skipping display in headless environment)")
    
    # Generate a random filename
    random_filename = generate_random_filename('.png')
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, img)
    
    if success:
        print(f"Image saved successfully as: {random_filename}")
    else:
        print(f"Failed to save image as: {random_filename}")

if __name__ == "__main__":
    main()