import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension=".jpg"):
    """Generate a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}{extension}"

def main():
    # Load an image
    image_path = "test_image.jpg"  # Using the test image we created
    
    # Check if image exists
    if not os.path.exists(image_path):
        print(f"Error: Image file {image_path} does not exist!")
        return
    
    # Load the image using OpenCV
    image = cv2.imread(image_path)
    
    # Check if image was loaded successfully
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Check if we're in a headless environment by checking for display
    display_available = os.environ.get('DISPLAY') is not None
    
    if display_available:
        try:
            # Display the image
            cv2.imshow('Loaded Image', image)
            
            # Wait for a key press (0 means wait indefinitely)
            print("Press any key to close the image window...")
            cv2.waitKey(0)
            
            # Close the image window
            cv2.destroyAllWindows()
            print("Image displayed successfully")
        except cv2.error as e:
            print(f"Could not display image: {e}")
            print("Continuing with saving the image...")
    else:
        print("Running in headless environment - skipping image display")
        print("Image loaded and ready to be saved")
    
    # Generate a random filename
    random_filename = generate_random_filename(".jpg")
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved successfully as: {random_filename}")
    else:
        print(f"Failed to save image as: {random_filename}")

if __name__ == "__main__":
    main()