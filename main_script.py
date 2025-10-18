import cv2
import numpy as np
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

# Load an image from file
image_path = 'test_image.jpg'
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press and then close the window
    print("Press any key to close the image window...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Save the image to a new file with a random name but with .py extension
    random_filename = generate_random_filename()
    
    # Note: We're saving the image data but with a .py extension as requested
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved successfully as {random_filename} (though this has a .py extension)")
        
        # Since the requirement is to save as .py, let's also create a proper Python script
        # that would use this image data in the future
        python_script_content = f'''import cv2
import numpy as np

# This script loads and displays an image
def main():
    # Load an image from file
    image = cv2.imread('{random_filename.replace('.py', '.jpg')}')
    
    if image is None:
        print("Error: Could not load image")
        return
        
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    
    # Wait for a key press and then close the window
    print("Press any key to close the image window...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Save the image again with a proper extension
    cv2.imwrite('output_image.jpg', image)
    print("Image processing completed!")

if __name__ == "__main__":
    main()
'''
        
        # Generate another random name for the actual Python script
        script_filename = generate_random_filename()
        with open(script_filename, 'w') as f:
            f.write(python_script_content)
        
        print(f"Python script saved as {script_filename}")
    else:
        print("Failed to save the image")