import cv2
import numpy as np

# Create a simple image (black background with a white rectangle)
image = np.zeros((400, 400, 3), dtype=np.uint8)
cv2.rectangle(image, (100, 100), (300, 300), (255, 255, 255), -1)

# Save the image
original_filename = 'sample_image.png'
cv2.imwrite(original_filename, image)
print(f"Created and saved original image as {original_filename}")

# Load the image using OpenCV
loaded_image = cv2.imread(original_filename)
print(f"Loaded image shape: {loaded_image.shape}")

# Add some text to the image
cv2.putText(loaded_image, 'OpenCV Demo', (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

# Display the image (this would open a window in a regular environment)
# In this environment, we'll just print info about the display operation
print("In a regular environment, this is where we would display the image with cv2.imshow()")
print("For this environment, we'll skip the display step to avoid issues")

# Save the modified image
modified_filename = 'modified_image.png'
cv2.imwrite(modified_filename, loaded_image)
print(f"Saved modified image as {modified_filename}")

print("Script execution completed!")