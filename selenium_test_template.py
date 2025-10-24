from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
import random
import string

def create_selenium_test():
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
        
        # You can add more interactions here if needed
        # For example, finding the search box:
        # search_box = driver.find_element(By.NAME, "q")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    create_selenium_test()