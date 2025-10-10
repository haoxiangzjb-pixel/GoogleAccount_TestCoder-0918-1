import cv2
import numpy as np
import os

# Load an image from file (replace 'path_to_image.jpg' with your image path)
# For this example, we'll create a simple synthetic image if a file isn't found.
image_path = 'example_image.jpg'
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a synthetic one instead.")
        create_synthetic = True
    else:
        create_synthetic = False
else:
    print(f"Image file {image_path} not found. Creating a synthetic one instead.")
    create_synthetic = True

if create_synthetic:
    # Create a simple 300x300 RGB image with a gradient
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    for i in range(300):
        for j in range(300):
            image[i, j] = [i % 256, j % 256, (i + j) % 256]

# Display the image in a window
# NOTE: cv2.imshow requires a GUI environment. Commenting out for headless execution.
# cv2.imshow('Loaded Image', image)
# cv2.waitKey(0)  # Wait for a key press
# cv2.destroyAllWindows()  # Close the window
print("Image loaded/display step skipped for headless environment.")

# Save the script with a random name
import random
import string

random_name = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
with open(random_name, 'w') as f:
    f.write('# This script was generated automatically\\n')
    f.write('# It loads, displays, and saves an image using OpenCV\\n\\n')
    f.write('import cv2\\n')
    f.write('import numpy as np\\n')
    f.write('import os\\n\\n')
    f.write("image_path = 'example_image.jpg'\\n")
    f.write('if os.path.exists(image_path):\\n')
    f.write('    image = cv2.imread(image_path)\\n')
    f.write('    if image is None:\\n')
    f.write('        create_synthetic = True\\n')
    f.write('    else:\\n')
    f.write('        create_synthetic = False\\n')
    f.write('else:\\n')
    f.write('    create_synthetic = True\\n\\n')
    f.write('if create_synthetic:\\n')
    f.write('    image = np.zeros((300, 300, 3), dtype=np.uint8)\\n')
    f.write('    for i in range(300):\\n')
    f.write('        for j in range(300):\\n')
    f.write('            image[i, j] = [i % 256, j % 256, (i + j) % 256]\\n\\n')
    f.write("cv2.imshow('Loaded Image', image)\\n")
    f.write('cv2.waitKey(0)\\n')
    f.write('cv2.destroyAllWindows()\\n\\n')
    f.write("output_path = 'output_image.jpg'\\n")
    f.write('cv2.imwrite(output_path, image)\\n')
    f.write('print(f"Image saved as {output_path}")\\n')

print(f"Script saved as {random_name}")

# Save the displayed image to a file as well
output_path = 'output_image.jpg'
cv2.imwrite(output_path, image)
print(f"Image saved as {output_path}")
