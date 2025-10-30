import cv2
import numpy as np

# Create a sample image with OpenCV
img = np.zeros((300, 300, 3), dtype=np.uint8)
# Draw some shapes to make it more interesting
cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), -1)  # Green square
cv2.circle(img, (150, 150), 50, (255, 0, 0), -1)  # Blue circle
cv2.putText(img, 'Sample Image', (70, 160), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 255), 2)

# Save the sample image
cv2.imwrite('sample_image.jpg', img)
print("Sample image created: sample_image.jpg")