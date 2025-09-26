import cv2
import numpy as np
import os

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

# Display the image in a window
cv2.imshow('Loaded Image', image)

# Wait for a key press and close the window
print("Press any key on the image window to close it and save the script.")
cv2.waitKey(0)
cv2.destroyAllWindows()

# Generate a random filename for the Python script
import random
import string
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save this script's content to the randomly named file
script_content = '''import cv2
import numpy as np
import os

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

# Display the image in a window
cv2.imshow('Loaded Image', image)

# Wait for a key press and close the window
print("Press any key on the image window to close it and save the script.")
cv2.waitKey(0)
cv2.destroyAllWindows()

# Generate a random filename for the Python script
import random
import string
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save this script's content to the randomly named file
with open(random_name, 'w') as f:
    f.write(script_content)

print(f"Script saved as {random_name}")

'''

with open(random_name, 'w') as f:
    f.write(script_content)

print(f"Script saved as {random_name}")
