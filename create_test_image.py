import cv2
import numpy as np

# Create a simple test image with different colors
img = np.zeros((300, 300, 3), dtype=np.uint8)
img[:, :100] = [255, 0, 0]    # Blue
img[:, 100:200] = [0, 255, 0]  # Green
img[:, 200:] = [0, 0, 255]     # Red

# Add some text
cv2.putText(img, 'Test Image', (50, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Save the image
cv2.imwrite('test_image.png', img)
print("Test image created successfully!")