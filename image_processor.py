import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension=".jpg"):
    """Generate a random filename with the specified extension."""
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for i in range(10))
    return random_name + extension

def main():
    # Load an image from file
    image_path = '/workspace/test_image.jpg'
    
    # Check if the image exists
    if not os.path.exists(image_path):
        print(f"Error: Image file {image_path} does not exist.")
        return
    
    # Load the image using OpenCV
    image = cv2.imread(image_path)
    
    # Check if the image was loaded successfully
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Display the image shape and basic info (since we're in a headless environment)
    print(f"Image shape: {image.shape}")
    print(f"Image dtype: {image.dtype}")
    print("Image loaded and processed successfully (display skipped in headless environment)")
    
    # Generate a random filename for saving
    random_filename = generate_random_filename(".jpg")
    save_path = os.path.join('/workspace', random_filename)
    
    # Save the image with the random filename
    success = cv2.imwrite(save_path, image)
    
    if success:
        print(f"Image saved successfully as: {save_path}")
    else:
        print("Error: Could not save the image.")

if __name__ == "__main__":
    main()