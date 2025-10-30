import cv2
import numpy as np
import random
import string

def load_display_save_image():
    # Load an image from file
    image = cv2.imread('sample_image.jpg')
    
    if image is None:
        print("Error: Could not load image.")
        return
    
    # Since we can't display images in headless environments, we'll just confirm the image was loaded
    print(f"Image loaded successfully. Shape: {image.shape}")
    
    # Generate a random filename with .py extension
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Save the image to the randomly named file
    # Note: We're actually saving the image data as binary in a .py file as requested
    with open(random_name, 'wb') as f:
        # Writing the image data as binary to the .py file
        success, encoded_image = cv2.imencode('.jpg', image)
        if success:
            f.write(encoded_image.tobytes())
    
    print(f"Image data saved to randomly named file: {random_name}")
    
    # For demonstration purposes, also save as a regular image file with random name
    random_image_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.jpg'
    cv2.imwrite(random_image_name, image)
    print(f"Regular image saved as: {random_image_name}")

if __name__ == "__main__":
    load_display_save_image()