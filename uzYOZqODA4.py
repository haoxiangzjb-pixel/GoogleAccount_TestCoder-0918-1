#!/usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import random
import string

def generate_random_string(length=8):
    """Generate a random string of specified length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def main():
    # Set up Firefox options
    options = webdriver.FirefoxOptions()
    options.add_argument("--headless")  # Run in headless mode
    
    # Create WebDriver instance
    print("Creating Firefox WebDriver instance...")
    driver = webdriver.Firefox(service=Service('/usr/local/bin/geckodriver'), options=options)
    
    try:
        # Open Google
        print("Opening Google...")
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        wait = WebDriverWait(driver, 10)
        search_box = wait.until(EC.presence_of_element_located((By.NAME, "q")))
        
        # Verify we're on Google
        assert "Google" in driver.title
        print(f"Successfully opened Google. Page title: {driver.title}")
        
        # Take a screenshot (optional)
        screenshot_name = f"google_screenshot_{generate_random_string()}.png"
        driver.save_screenshot(screenshot_name)
        print(f"Screenshot saved as {screenshot_name}")
        
        # Perform a search
        search_term = "Selenium WebDriver"
        print(f"Searching for: {search_term}")
        search_box.send_keys(search_term)
        search_box.send_keys(u'\ue007')  # Press Enter key
        
        # Wait for search results
        results = wait.until(EC.presence_of_element_located((By.ID, "search")))
        print("Search results loaded successfully")
        
        # Print first few search result titles
        result_links = driver.find_elements(By.CSS_SELECTOR, "h3")
        print("\nFirst few search results:")
        for i, link in enumerate(result_links[:5]):
            print(f"{i+1}. {link.text}")
            
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the browser
        print("\nClosing browser...")
        driver.quit()
        print("Browser closed successfully")

if __name__ == "__main__":
    main()