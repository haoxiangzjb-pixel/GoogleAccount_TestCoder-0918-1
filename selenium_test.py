import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Create the Selenium test code
selenium_test_code = '''
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

def test_open_google():
    # Initialize the Chrome driver
    driver = webdriver.Chrome()
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(3)
        
        # Print the title of the page
        print(f"Page title: {driver.title}")
        
        # Verify we're on the Google page
        assert "Google" in driver.title
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''

# Generate a random filename
random_filename = generate_random_filename()

# Write the test code to the randomly named file
with open(random_filename, 'w') as f:
    f.write(selenium_test_code.strip())

print(f"Selenium test saved to: {random_filename}")