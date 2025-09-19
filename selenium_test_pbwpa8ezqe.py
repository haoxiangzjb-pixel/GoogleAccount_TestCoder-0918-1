import random
import string
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"selenium_test_{random_chars}.py"

def main():
    # Set up Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    # Initialize the Chrome driver
    driver = webdriver.Chrome(options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(3)
        
        # Verify we're on Google by checking the title
        assert "Google" in driver.title
        print("Successfully opened Google!")
        
        # Additional check - verify search box exists
        search_box = driver.find_element(By.NAME, "q")
        assert search_box.is_displayed()
        print("Search box found!")
        
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    main()