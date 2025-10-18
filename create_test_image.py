import cv2
import numpy as np

# Create a simple test image with a colored rectangle and text
img = np.zeros((300, 300, 3), dtype=np.uint8)
img[:] = [255, 255, 255]  # White background

# Draw a blue rectangle
cv2.rectangle(img, (50, 50), (250, 250), (255, 0, 0), -1)

# Draw some text
cv2.putText(img, 'Test Image', (90, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Save the image
cv2.imwrite('test_image.jpg', img)
print("Test image created successfully!")