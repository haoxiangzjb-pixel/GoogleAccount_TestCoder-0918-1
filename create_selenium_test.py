import secrets
import string
import os

# Generate a random filename
alphabet = string.ascii_lowercase + string.digits
random_name = ''.join(secrets.choice(alphabet) for _ in range(10))
filename = f"{random_name}.py"

# Create the Selenium test content
test_content = '''from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Initialize the webdriver (using Chrome in this example)
# Make sure you have ChromeDriver installed and in PATH
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Wait for page to load
    time.sleep(3)
    
    # Verify we're on Google by checking the title
    assert "Google" in driver.title
    print("Successfully opened Google!")
    
finally:
    # Close the browser
    driver.quit()
'''

# Write the content to the file
with open(filename, 'w') as f:
    f.write(test_content)

print(f"Created Selenium test file: {filename}")

# Run the test file
os.system(f"python {filename}")