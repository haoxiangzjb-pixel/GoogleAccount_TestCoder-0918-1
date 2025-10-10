import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path/to/your/image.jpg' with the actual path to your image
image_path = 'path/to/your/image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window named 'Image'
    cv2.imshow('Image', image)

    # Wait for a key press and close the window
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Save the loaded image to a new file with a random name
    import random
    import string

    def generate_random_filename(extension='.jpg'):
        """Generates a random filename with the given extension."""
        random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
        return f"{random_name}{extension}"

    output_filename = generate_random_filename('.jpg')
    success = cv2.imwrite(output_filename, image)

    if success:
        print(f"Image saved successfully as {output_filename}")
    else:
        print("Failed to save the image.")
