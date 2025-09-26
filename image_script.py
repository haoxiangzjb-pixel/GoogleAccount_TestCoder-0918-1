import cv2
import numpy as np
import os

# Load an image from file
# For demonstration, we'll create a simple image if a specific file is not found
image_path = 'example_image.jpg' # You can change this to the path of your image
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a sample image instead.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
        cv2.putText(image, 'Sample', (100, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
else:
    print(f"Image file {image_path} not found. Creating a sample image instead.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
    cv2.putText(image, 'Sample', (100, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)

# Display the image in a window
cv2.imshow('Loaded Image', image)

# Wait for a key press and close the window
print("Press any key on the image window to close it and save the script.")
cv2.waitKey(0)
cv2.destroyAllWindows()

# The script is already saved as image_script.py
print("Script saved as image_script.py")