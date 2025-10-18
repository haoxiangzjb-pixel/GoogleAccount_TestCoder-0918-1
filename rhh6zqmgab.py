import cv2
import numpy as np

def main():
    # Load the saved image
    image = cv2.imread("m3jdd1qnu7.jpg")
    
    if image is None:
        print("Error: Could not load image")
        return
    
    print("Image loaded successfully!")
    print(f"Image shape: {image.shape}")
    
    # Display basic image information
    height, width, channels = image.shape
    print(f"Image dimensions: {width}x{height} with {channels} channels")
    
    # Save the image again (as an example operation)
    cv2.imwrite("processed_output.jpg", image)
    print("Processing completed!")

if __name__ == "__main__":
    main()
