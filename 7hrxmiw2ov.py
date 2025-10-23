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
    # Create a sample image (since we don't know if user has a specific image)
    # This creates a simple colored image for demonstration
    height, width = 400, 600
    sample_image = np.zeros((height, width, 3), dtype=np.uint8)
    
    # Add some color to the image
    sample_image[:, :width//3] = [255, 0, 0]      # Blue left third
    sample_image[:, width//3:2*width//3] = [0, 255, 0]  # Green middle third
    sample_image[:, 2*width//3:] = [0, 0, 255]   # Red right third
    
    # Draw a circle in the center
    center_coordinates = (width//2, height//2)
    radius = 50
    color = (255, 255, 255)  # White
    thickness = 2
    cv2.circle(sample_image, center_coordinates, radius, color, thickness)
    
    print("Created an image with dimensions:", sample_image.shape)
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    main()
