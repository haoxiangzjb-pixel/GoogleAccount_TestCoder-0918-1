import cv2
import numpy as np
import os

# Load an image from file
# Using a placeholder path. This script assumes an image named 'input.jpg' exists in the working directory.
image_path = 'input.jpg'

# Check if the input image exists before attempting to load
if not os.path.exists(image_path):
    print(f"Image {image_path} not found. Creating a sample image for demonstration.")
    # Create a sample image (a red square on a black background)
    sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(sample_img, (50, 50), (250, 250), (0, 0, 255), -1)  # BGR for red
    cv2.imwrite(image_path, sample_img)

# Load the image
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Save the loaded image to a new file with a random name
    import random
    import string

    def generate_random_filename(length=8, extension='.jpg'):
        letters = string.ascii_lowercase
        return ''.join(random.choice(letters) for i in range(length)) + extension

    output_filename = generate_random_filename()
    success = cv2.imwrite(output_filename, image)

    if success:
        print(f"Image successfully saved as {output_filename}")
    else:
        print(f"Failed to save image as {output_filename}")
