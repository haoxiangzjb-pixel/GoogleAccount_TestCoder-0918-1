import cv2
import numpy as np
import os

# Load an image from the current directory
image_path = 'sample_image.jpg' # Assuming an image exists, or create a blank one for demo
if os.path.exists(image_path):
    image = cv2.imread(image_path)
else:
    # Create a sample image if file not found
    print(f"Image {image_path} not found. Creating a sample image.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1)  # Green rectangle
    cv2.putText(image, 'Sample', (100, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# (Optional) Print image shape to confirm it's loaded/created
print(f"Image shape: {image.shape}")

# Save the image to a new file with a random name
import random
import string

random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.jpg'
cv2.imwrite(random_name, image)
print(f"Image saved as {random_name}")
