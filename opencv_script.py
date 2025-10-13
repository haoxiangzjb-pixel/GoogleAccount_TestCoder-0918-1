import cv2
import numpy as np
import os

# Load an image from the workspace
image_path = '/workspace/image.jpg'
image = cv2.imread(image_path)

if image is not None:
    # Generate a random filename for the saved image
    random_filename = f'/workspace/saved_image_{np.random.randint(10000, 99999)}.jpg'

    # Save the loaded image with the random filename
    success = cv2.imwrite(random_filename, image)
    if success:
        print(f"Image successfully saved as {random_filename}")
    else:
        print("Failed to save the image.")
else:
    print(f"Error: Could not load image from {image_path}")
