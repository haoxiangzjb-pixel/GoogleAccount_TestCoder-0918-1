from PIL import Image, ImageDraw
import random

# Create a random filename for the test image
width, height = 300, 200
image = Image.new('RGB', (width, height), color=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))
draw = ImageDraw.Draw(image)

# Draw some shapes to make it interesting
draw.ellipse((50, 50, 250, 150), fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))
draw.rectangle((100, 75, 200, 125), fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))

# Save the image
image.save('/workspace/test_image.jpg')
print("Test image created successfully!")