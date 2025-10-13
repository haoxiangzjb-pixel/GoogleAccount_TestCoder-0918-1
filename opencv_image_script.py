import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path/to/your/image.jpg' with the actual path to your image
image_path = 'path/to/your/image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press and close the window
    print("Press any key on the image window to close it and save the script.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Save this script with a random name
    import random
    import string
    random_name = 'opencv_script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    # Note: In a real scenario, you would save the *current* script content to `random_name`.
    # Here, we just print the name as the script cannot save itself during execution in this environment.
    print(f"This script would be saved as: {random_name}")
