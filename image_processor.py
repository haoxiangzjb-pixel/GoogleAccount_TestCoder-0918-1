import cv2
import numpy as np
import os

# Load an image from file
# Using a placeholder path, assuming an image named 'input.jpg' exists in the workspace.
# If not, we'll create a simple synthetic image for demonstration.
image_path = '/workspace/input.jpg'
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    print(f"Loaded image from {image_path}")
else:
    print(f"Image {image_path} not found. Creating a simple synthetic image.")
    # Create a simple 300x300 BGR image with a white rectangle
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (255, 255, 255), -1) # White rectangle
    cv2.rectangle(image, (50, 50), (250, 250), (0, 0, 0), 2) # Black border

# Display the image in a window named 'Image Display'
cv2.imshow('Image Display', image)

# Wait for a key press indefinitely
cv2.waitKey(0)

# Close all OpenCV windows
cv2.destroyAllWindows()

# Save the (potentially processed) image
# Generate a random filename for the Python script
import random
import string
random_filename = 'processed_image_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6)) + '.jpg'
output_path = os.path.join('/workspace', random_filename)
cv2.imwrite(output_path, image)
print(f"Saved processed image to {output_path}")
