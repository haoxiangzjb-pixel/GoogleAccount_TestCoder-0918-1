import cv2
import numpy as np

# Create a sample image (black image with a white rectangle and text)
img = np.zeros((400, 600, 3), dtype=np.uint8)

# Draw a white rectangle
cv2.rectangle(img, (50, 50), (550, 350), (255, 255, 255), -1)

# Add some text
cv2.putText(img, 'OpenCV Demo', (100, 200), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 3)

# Generate a random filename for saving
import random
import string
saved_filename = ''.join(random.choices(string.ascii_lowercase, k=8)) + '.jpg'

# Save the image
cv2.imwrite(saved_filename, img)
print(f"Image saved as {saved_filename}")

# Display image information
print(f"Image shape: {img.shape}")
print(f"Image dtype: {img.dtype}")