import cv2
import numpy as np
import random
import string

# Load an image from file
image = cv2.imread('sample_image.jpg')

# Check if image is loaded successfully
if image is None:
    print("Error: Could not load image. Please check the file path.")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press (0 means wait indefinitely)
    print("Press any key in the image window to close it and continue...")
    cv2.waitKey(0)
    
    # Close all OpenCV windows
    cv2.destroyAllWindows()
    
    # Save the image to a new file with a random name
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.jpg'
    cv2.imwrite(random_name, image)
    print(f"Image saved with random name: {random_name}")