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