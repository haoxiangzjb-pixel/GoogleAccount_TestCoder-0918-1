import cv2
import numpy as np
import os

# Load an image from the workspace or create a blank one if it doesn't exist
image_path = '/workspace/image_processing/test_image.jpg'
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    print(f"Image loaded from {image_path}")
else:
    # Create a blank white image if the file doesn't exist
    image = np.ones((300, 300, 3), dtype=np.uint8) * 255
    print("Image not found, creating a blank white image.")



# Save the image (or the blank one we created) with a random name
random_filename = f'/workspace/image_processing/random_output_{np.random.randint(10000, 99999)}.jpg'
cv2.imwrite(random_filename, image)
print(f"Image saved as {random_filename}")
