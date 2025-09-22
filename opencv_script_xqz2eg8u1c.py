import cv2
import numpy as np
import random
import string

# Load an image from file
image_path = '/workspace/sample_image.png'
image = cv2.imread(image_path)

# Check if image was loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
    exit()

print("Image loaded successfully!")

# Generate a random filename for saving
random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
output_path = f'/workspace/processed_image_{random_suffix}.png'

# Save the image to a new file
cv2.imwrite(output_path, image)
print(f"Image saved to: {output_path}")

# Perform a simple operation: convert to grayscale
gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Save the grayscale image
gray_output_path = f'/workspace/gray_image_{random_suffix}.png'
cv2.imwrite(gray_output_path, gray_image)
print(f"Grayscale image saved to: {gray_output_path}")

# Print image properties
print(f"Original image shape: {image.shape}")
print(f"Grayscale image shape: {gray_image.shape}")