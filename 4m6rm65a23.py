import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def load_and_display_image(image_path):
    """Load an image, display it, and save this script with a random name."""
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # Display the image
    cv2.imshow('Image', img)
    print("Press any key in the image window to close it...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Print image shape
    print(f"Image shape: {img.shape}")
    
    # Generate a random filename for this script
    random_script_name = generate_random_filename(".py")
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the script content to the new file with random name
    with open(random_script_name, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_script_name}")

def has_gui():
    """Check if GUI is available."""
    try:
        import tkinter
        tk = tkinter.Tk()
        tk.destroy()
        return True
    except:
        return False

if __name__ == "__main__":
    # Using a placeholder image path - in a real scenario, you'd provide an actual image
    # For this example, let's create a simple synthetic image to demonstrate
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    img[:] = [255, 100, 0]  # Blue color
    
    # Draw some shapes to make the image more interesting
    cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), 3)
    cv2.circle(img, (150, 150), 50, (0, 0, 255), -1)
    
    # Check if GUI is available before trying to display
    if has_gui():
        # Display the synthetic image
        cv2.imshow('Synthetic Image', img)
        print("Press any key in the image window to close it...")
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        print("Image displayed successfully")
    else:
        print("GUI not available, skipping image display. Saving image to file instead...")
        # Save the synthetic image to a file
        cv2.imwrite('synthetic_image.jpg', img)
        print("Synthetic image saved as 'synthetic_image.jpg'")
    
    # Print image shape
    print(f"Image shape: {img.shape}")
    
    # Generate a random filename for this script
    random_script_name = generate_random_filename(".py")
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the script content to the new file with random name
    with open(random_script_name, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_script_name}")