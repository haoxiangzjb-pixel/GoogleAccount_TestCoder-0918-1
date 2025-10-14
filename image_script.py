import cv2
import numpy as np
import os

# Load an image from the workspace directory or provide a path
image_path = '/workspace/lena512color.tiff'  # Example path, replace if image is elsewhere
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
    # Create a simple synthetic image if the file is not found
    print("Creating a synthetic test image...")
    image = np.zeros((512, 512, 3), dtype=np.uint8)
    image[:] = (255, 0, 0)  # Fill with blue color
    cv2.rectangle(image, (100, 100), (400, 400), (0, 255, 0), thickness=5)  # Add a green rectangle
    cv2.putText(image, 'Test Image', (150, 250), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 3)

# Save the image to a new file with a random name
import random
import string
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.png'
output_path = f'/workspace/{random_name}'
cv2.imwrite(output_path, image)
print(f"Image saved as {output_path}")

# Print a message instead of displaying the image
print("Image loaded/created and saved successfully. Display skipped in terminal environment.")