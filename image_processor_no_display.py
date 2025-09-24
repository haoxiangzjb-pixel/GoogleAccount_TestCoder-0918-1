import cv2
import numpy as np
import os
import random
import string

# Create a simple 300x300 BGR image with a white rectangle (since no input file is guaranteed)
print("Creating a simple synthetic image.")
image = np.zeros((300, 300, 3), dtype=np.uint8)
cv2.rectangle(image, (50, 50), (250, 250), (255, 255, 255), -1) # White rectangle
cv2.rectangle(image, (50, 50), (250, 250), (0, 0, 0), 2) # Black border

# We skip cv2.imshow and cv2.waitKey as they require a GUI

# Save the image
# Generate a random filename for the saved image
random_filename = 'processed_image_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6)) + '.jpg'
output_path = os.path.join('/workspace', random_filename)
cv2.imwrite(output_path, image)
print(f"Saved processed image to {output_path}")

# As per the request, save the *script itself* to a randomly named .py file
script_content = '''import cv2
import numpy as np
import os
import random
import string

# Create a simple 300x300 BGR image with a white rectangle (since no input file is guaranteed)
print("Creating a simple synthetic image.")
image = np.zeros((300, 300, 3), dtype=np.uint8)
cv2.rectangle(image, (50, 50), (250, 250), (255, 255, 255), -1) # White rectangle
cv2.rectangle(image, (50, 50), (250, 250), (0, 0, 0), 2) # Black border

# We skip cv2.imshow and cv2.waitKey as they require a GUI

# Save the image
# Generate a random filename for the saved image
random_filename = 'processed_image_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6)) + '.jpg'
output_path = os.path.join('/workspace', random_filename)
cv2.imwrite(output_path, image)
print(f"Saved processed image to {output_path}")
'''

random_script_filename = 'opencv_script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
script_output_path = os.path.join('/workspace', random_script_filename)
with open(script_output_path, 'w') as f:
    f.write(script_content)

print(f"Saved the Python script itself to {script_output_path}")
