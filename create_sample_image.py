import cv2
import numpy as np

# Create a simple colored image
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[:] = [255, 100, 50]  # Blue, Green, Red - orange color

# Add some text to make it more interesting
cv2.putText(image, 'Sample Image', (50, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Save the image
cv2.imwrite('sample_image.jpg', image)
print("Sample image created successfully!")