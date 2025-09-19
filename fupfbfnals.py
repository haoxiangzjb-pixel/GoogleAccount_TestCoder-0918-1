import cv2
import numpy as np

# Create a sample image (black background with colored shapes)
image = np.zeros((400, 400, 3), dtype=np.uint8)

# Draw a blue rectangle
cv2.rectangle(image, (50, 50), (200, 200), (255, 0, 0), -1)

# Draw a green circle
cv2.circle(image, (300, 100), 50, (0, 255, 0), -1)

# Draw a red ellipse
cv2.ellipse(image, (150, 300), (100, 50), 45, 0, 360, (0, 0, 255), -1)

# Add some text
cv2.putText(image, 'OpenCV Example', (50, 380), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Display the image (commented out for headless environments)
# cv2.imshow('Generated Image', image)
print("Image generated. In a headless environment, skipping display.")

# Wait for a key press and close the window (commented out for headless environments)
# cv2.waitKey(0)
# cv2.destroyAllWindows()

# Save the image
output_filename = 'output_image.png'
cv2.imwrite(output_filename, image)
print(f"Image saved as {output_filename}")