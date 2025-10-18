import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension=".py"):
    """Generate a random filename with the specified extension"""
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}{extension}"

# Load an image from file
image_path = 'test_image.jpg'
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
        # In a headless environment, we skip displaying the image
    print("Image loaded successfully. (Skipping display in headless environment)")
    
        # Generate a random name for the image file with proper extension
    image_random_filename = generate_random_filename(".jpg")
    
    # Save the image with proper extension
    success = cv2.imwrite(image_random_filename, image)
    
    if success:
        print(f"Image saved successfully as {image_random_filename}")
        
        # Now create a Python script with a random name that will use this image
        script_random_filename = generate_random_filename(".py")
        
        # Create the Python script content that will load and process this image
        script_content = f'''import cv2
import numpy as np

def main():
    # Load the saved image
    image = cv2.imread("{image_random_filename}")
    
    if image is None:
        print("Error: Could not load image")
        return
    
    print("Image loaded successfully!")
    print(f"Image shape: {{image.shape}}")
    
    # Display basic image information
    height, width, channels = image.shape
    print(f"Image dimensions: {{width}}x{{height}} with {{channels}} channels")
    
    # Save the image again (as an example operation)
    cv2.imwrite("processed_output.jpg", image)
    print("Processing completed!")

if __name__ == "__main__":
    main()
'''
        
        # Write the Python script to file
        with open(script_random_filename, 'w') as f:
            f.write(script_content)
        
        print(f"Python script created as {script_random_filename}")
        print("This script can be run to load and process the saved image.")
    else:
        print("Failed to save the image")