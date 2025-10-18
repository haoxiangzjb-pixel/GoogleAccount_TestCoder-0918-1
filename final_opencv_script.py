import cv2
import numpy as np
import random
import string
import os

# Load an image from file
image = cv2.imread('sample_image.jpg')

# Check if image is loaded successfully
if image is None:
    print("Error: Could not load image. Please check the file path.")
else:
    print("Image loaded successfully!")
    
    # Since we're likely in a headless environment, skip the display
    print("Running in headless environment - skipping image display")
    
    # Save the image to a new file with a random name
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.jpg'
    cv2.imwrite(random_name, image)
    print(f"Image saved with random name: {random_name}")