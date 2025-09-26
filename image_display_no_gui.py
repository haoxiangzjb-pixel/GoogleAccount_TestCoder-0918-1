import cv2
import numpy as np
import os
import random
import string

# Load an image from the current directory. Replace 'image.jpg' with your image filename.
# For demonstration, we'll create a simple synthetic image if a real one isn't found.
image_path = 'image.jpg'
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a synthetic one instead.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
        cv2.putText(image, 'Hello OpenCV!', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
else:
    print(f"Image file {image_path} not found. Creating a synthetic one.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
    cv2.putText(image, 'Hello OpenCV!', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Attempt to display the image in a window (this might fail in headless environments)
try:
    cv2.imshow('Loaded Image', image)
    # Wait for a key press and close the window
    print("Attempting to display image. If running headlessly, this will fail.")
    cv2.waitKey(1) # Non-blocking wait
    cv2.destroyAllWindows()
except cv2.error as e:
    print(f"Could not display image in this environment: {e}")

# Generate a random filename for the Python script
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save this script's content to the randomly named file
current_script_content = '''import cv2
import numpy as np
import os
import random
import string

# Load an image from the current directory. Replace 'image.jpg' with your image filename.
# For demonstration, we'll create a simple synthetic image if a real one isn't found.
image_path = 'image.jpg'
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a synthetic one instead.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
        cv2.putText(image, 'Hello OpenCV!', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
else:
    print(f"Image file {image_path} not found. Creating a synthetic one.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Draw a green square
    cv2.putText(image, 'Hello OpenCV!', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Attempt to display the image in a window (this might fail in headless environments)
try:
    cv2.imshow('Loaded Image', image)
    # Wait for a key press and close the window
    print("Attempting to display image. If running headlessly, this will fail.")
    cv2.waitKey(1) # Non-blocking wait
    cv2.destroyAllWindows()
except cv2.error as e:
    print(f"Could not display image in this environment: {e}")

# Generate a random filename for the Python script
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save this script's content to the randomly named file
current_script_content = ''''' + "'''" + '''

with open(random_name, 'w') as f:
    f.write(current_script_content)

print(f"Script saved as {random_name}")

'''

with open(random_name, 'w') as f:
    f.write(current_script_content)

print(f"Script saved as {random_name}")
