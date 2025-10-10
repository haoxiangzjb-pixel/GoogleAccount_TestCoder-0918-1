from selenium import webdriver
from selenium.webdriver.common.by import By
import time

def test_open_google():
    # Initialize the Chrome WebDriver
    driver = webdriver.Chrome()
    
    try:
        # Navigate to Google
        driver.get("https://www.google.com")
        
        # Wait for a few seconds to see the page
        time.sleep(3)
        
        # Optionally, you can add assertions here to verify the page title or elements
        assert "Google" in driver.title
        
        print("Test passed: Successfully opened Google.")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
