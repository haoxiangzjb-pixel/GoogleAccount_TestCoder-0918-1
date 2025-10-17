import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension='.jpg'):
    """Generate a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}{extension}"

def main():
    # Load an image from file
    image_path = '/workspace/test_image.jpg'
    
    # Check if the image file exists
    if not os.path.exists(image_path):
        print(f"Error: Image file {image_path} does not exist.")
        return
    
    # Load the image
    image = cv2.imread(image_path)
    
    # Check if the image was loaded successfully
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Skip image display in headless environment
    print("Image loaded successfully (skipping display in headless environment).")
    
    # Generate a random filename for saving
    random_filename = generate_random_filename('.jpg')
    save_path = f'/workspace/{random_filename}'
    
    # Save the image with the random filename
    success = cv2.imwrite(save_path, image)
    
    if success:
        print(f"Image saved successfully as: {save_path}")
    else:
        print(f"Error: Could not save image to {save_path}")

if __name__ == "__main__":
    main()