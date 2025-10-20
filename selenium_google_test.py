from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.common.by import By
from webdriver_manager.firefox import GeckoDriverManager
from selenium.webdriver.firefox.service import Service
import time
import random
import string
import os

def create_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Set up Firefox options
    firefox_options = Options()
    firefox_options.add_argument("--headless")  # Run in headless mode (optional)
    
    try:
        # Set up the Firefox driver with GeckoDriverManager
        service = Service(GeckoDriverManager().install())
        driver = webdriver.Firefox(service=service, options=firefox_options)
        
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(2)
        
        # Verify we're on the Google page
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
        # Create the random filename
        random_filename = create_random_filename()
        
        # Save this script to the randomly named file
        with open(random_filename, 'w') as f:
            f.write('''from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.common.by import By
from webdriver_manager.firefox import GeckoDriverManager
from selenium.webdriver.firefox.service import Service
import time

def main():
    # Set up Firefox options
    firefox_options = Options()
    firefox_options.add_argument("--headless")  # Run in headless mode (optional)
    
    try:
        # Set up the Firefox driver with GeckoDriverManager
        service = Service(GeckoDriverManager().install())
        driver = webdriver.Firefox(service=service, options=firefox_options)
        
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(2)
        
        # Verify we're on the Google page
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        
    except Exception as e:
        print(f"An error occurred: {e}")
    
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    main()''')
        
        print(f"Selenium test saved to: {random_filename}")
        
    except Exception as e:
        print(f"An error occurred: {e}")
    
    finally:
        # Close the browser
        try:
            driver.quit()
        except:
            pass

if __name__ == "__main__":
    main()