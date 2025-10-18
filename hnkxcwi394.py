import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(ext='.py'):
    """Generate a random filename with the specified extension."""
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for i in range(10))
    return random_name + ext

def load_display_save_image(image_path='sample_image.jpg'):
    """
    Load an image, display it, and save this script with a random name.
    """
    try:
        # Load an image from file
        img = cv2.imread(image_path)
        
        if img is None:
            # If no image exists at the path, create a sample image
            print(f"Image not found at {image_path}, creating a sample image instead.")
            img = np.zeros((300, 300, 3), dtype=np.uint8)
            # Create a colorful pattern
            img[:, :100] = [255, 0, 0]      # Blue
            img[:, 100:200] = [0, 255, 0]   # Green
            img[:, 200:] = [0, 0, 255]      # Red
            
            # Draw some shapes
            cv2.rectangle(img, (50, 50), (250, 250), (255, 255, 255), 2)
            cv2.circle(img, (150, 150), 50, (255, 255, 255), -1)
        else:
            print(f"Image loaded successfully from {image_path}")
        
        # Check if we're in a headless environment before trying to display
        import os
        if os.environ.get('DISPLAY'):
            try:
                # Display the image in a window
                cv2.imshow('Image', img)
                print("Displaying image. Press any key to close the window and continue...")
                cv2.waitKey(0)  # Wait for a key press
                cv2.destroyAllWindows()  # Close the window
            except cv2.error as e:
                print(f"Could not display image: {e}")
                print("Image processing completed without display.")
        else:
            print("Running in headless environment, skipping image display.")
            print("Image loaded/created successfully but not displayed.")
        
        # Generate a random filename for this script
        random_filename = generate_random_filename('.py')
        
        # Read the current script content
        with open(__file__, 'r') as original_file:
            script_content = original_file.read()
        
        # Write the script content to the new file with random name
        with open(random_filename, 'w') as new_file:
            new_file.write(script_content)
        
        print(f"Script saved with random name: {random_filename}")
        
        return img
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    # Run the function
    loaded_image = load_display_save_image()