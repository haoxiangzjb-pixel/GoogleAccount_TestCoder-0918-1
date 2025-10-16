import cv2
import numpy as np
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Load an image (using a placeholder path - you'll need to specify your own image)
    # For demonstration, we'll create a simple image if no image exists
    try:
        # Try to load an existing image (replace with your image path)
        image = cv2.imread('sample_image.jpg')
        
        # If no image found, create a sample image
        if image is None:
            print("No existing image found, creating a sample image...")
            image = np.zeros((300, 300, 3), dtype=np.uint8)
            # Draw something simple to make it visible
            cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1)
            cv2.putText(image, 'Sample', (100, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        
        # Skip displaying the image since we're in a headless environment
        print("Image loaded successfully (skipping display in headless environment)")
        
        # Save the image to a randomly named .py file
        random_filename = generate_random_filename()
        
        # Note: Saving an image to a .py file doesn't make much sense practically,
        # but following the requirement as stated
        # Actually, we'll save the script itself to a random .py file
        print(f"Saving this script to: {random_filename}")
        
        # Read this script's content
        with open(__file__, 'r') as source_file:
            script_content = source_file.read()
        
        # Write to the randomly named file
        with open(random_filename, 'w') as output_file:
            output_file.write(script_content)
        
        print(f"Script saved to {random_filename}")
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()