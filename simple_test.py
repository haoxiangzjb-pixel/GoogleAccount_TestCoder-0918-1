#!/usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
import time

def main():
    # Set up Firefox options
    options = Options()
    options.add_argument("--headless")  # Run in headless mode
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    
    # Create WebDriver instance
    print("Creating Firefox WebDriver instance...")
    service = Service('/usr/local/bin/geckodriver')
    driver = webdriver.Firefox(service=service, options=options)
    
    try:
        # Open Google
        print("Opening Google...")
        driver.get("https://www.google.com")
        
        # Wait a moment for page to load
        time.sleep(3)
        
        # Verify we're on Google
        print(f"Page title: {driver.title}")
        if "Google" in driver.title:
            print("SUCCESS: Successfully opened Google!")
        else:
            print("ERROR: Not on Google page")
            
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the browser
        print("Closing browser...")
        driver.quit()
        print("Browser closed successfully")

if __name__ == "__main__":
    main()