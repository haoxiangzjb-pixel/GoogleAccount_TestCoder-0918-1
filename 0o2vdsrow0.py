from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import time

def test_open_google():
    """Test to open Google homepage"""
    # Initialize the Chrome driver with webdriver-manager
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(3)
        
        # Verify we're on Google by checking the title
        assert "Google" in driver.title
        print("Successfully opened Google!")
        print(f"Page title: {driver.title}")
        
    except Exception as e:
        print(f"Error occurred: {e}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()