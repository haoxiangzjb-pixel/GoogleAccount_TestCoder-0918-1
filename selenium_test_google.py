import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

def create_selenium_test():
    # Create the Selenium test code
    selenium_code = """from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

def test_open_google():
    # Initialize the Chrome driver
    driver = webdriver.Chrome()
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        time.sleep(3)
        
        # Print the title of the page
        print(f"Page title: {driver.title}")
        
        # You can add more interactions here if needed
        # For example, find the search box:
        # search_box = driver.find_element(By.NAME, "q")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
"""

    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Write the selenium code to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(selenium_code)
    
    print(f"Selenium test saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    create_selenium_test()