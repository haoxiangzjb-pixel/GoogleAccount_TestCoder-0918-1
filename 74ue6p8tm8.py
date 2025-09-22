from selenium import webdriver
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
