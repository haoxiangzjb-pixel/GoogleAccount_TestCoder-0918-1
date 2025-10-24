import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_selenium_test():
    # Set up the Selenium test code
    selenium_code = '''from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
import random
import string

def run_test():
    # Set up Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in background, remove this if you want to see the browser
    
    # Initialize the driver
    driver = webdriver.Chrome(options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait a bit to ensure the page loads
        time.sleep(2)
        
        # Verify we're on the Google page by checking the title
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    run_test()
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the code to the randomly named file
    filepath = os.path.join("/workspace", random_filename)
    with open(filepath, 'w') as f:
        f.write(selenium_code)
    
    print(f"Selenium test saved to: {filepath}")
    return filepath

if __name__ == "__main__":
    create_selenium_test()