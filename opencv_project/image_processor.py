import cv2
import numpy as np
import random
import string
import os

# Always assume headless environment for this script
HEADLESS = True
print("Running in headless mode - all display functions will be skipped")

def generate_random_string(length=10):
    """Generate a random string of ASCII characters."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def create_sample_image(filename='sample.jpg'):
    """Create a simple sample image with OpenCV."""
    # Create a black image
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    
    # Draw a blue rectangle
    cv2.rectangle(img, (50, 50), (250, 250), (255, 0, 0), -1)
    
    # Draw a green circle
    cv2.circle(img, (150, 150), 50, (0, 255, 0), -1)
    
    # Draw a red line
    cv2.line(img, (0, 0), (300, 300), (0, 0, 255), 5)
    
    # Save the image
    cv2.imwrite(filename, img)
    print(f"Sample image saved as {filename}")
    return filename

def load_and_display_image(image_path):
    """Load an image using OpenCV (display skipped in headless mode)."""
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return None
    
    # Skip display in headless mode
    print("Image loaded successfully (display skipped in headless mode)")
    
    return img

def save_image_with_random_name(img):
    """Save an image with a randomly generated filename."""
    # Generate a random filename
    random_name = generate_random_string() + '.jpg'
    
    # Save the image with the random name
    success = cv2.imwrite(random_name, img)
    
    if success:
        print(f"Image saved with random name: {random_name}")
    else:
        print("Error: Could not save image with random name")
    
    return random_name if success else None

def main():
    # Create a sample image
    sample_filename = create_sample_image()
    
    # Load and display the image
    img = load_and_display_image(sample_filename)
    
    if img is not None:
        # Save the image with a random name
        random_filename = save_image_with_random_name(img)
        
        if random_filename:
            print(f"Process completed successfully. Original: {sample_filename}, Copy: {random_filename}")
        else:
            print("Failed to save image with random name")
    else:
        print("Process failed during image loading")

if __name__ == "__main__":
    main()