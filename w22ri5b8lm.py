import cv2
import numpy as np
import os
import random
import string

def load_and_display_image(image_path):
    """
    Load an image using OpenCV, display it (or just process it in headless mode), 
    and save the script with a random name
    """
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # In a headless environment, we'll just print image info instead of displaying
    print(f"Image loaded successfully. Shape: {image.shape}")
    
    # Generate a random filename for the script
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    random_filename = f"{random_name}.py"
    
    # Read the current script content
    current_script_path = os.path.abspath(__file__)
    with open(current_script_path, 'r') as f:
        script_content = f.read()
    
    # Write the script content to the new file with random name
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_filename}")
    
    return image

if __name__ == "__main__":
    # For demonstration purposes, we'll create a simple test image if one doesn't exist
    test_image_path = "test_image.jpg"
    
    # Create a simple test image if it doesn't exist
    if not os.path.exists(test_image_path):
        # Create a simple colored image
        test_img = np.zeros((300, 300, 3), dtype=np.uint8)
        test_img[:] = [255, 100, 50]  # Blue, Green, Red
        
        # Add some text
        cv2.putText(test_img, 'Test Image', (50, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        
        # Save the test image
        cv2.imwrite(test_image_path, test_img)
        print(f"Created test image: {test_image_path}")
    
    # Load and process the image
    load_and_display_image(test_image_path)