from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import random
import string

# Optional: Specify the path to your ChromeDriver if it's not in PATH
# service = Service('/path/to/chromedriver')
# driver = webdriver.Chrome(service=service)

# Initialize the Chrome driver (assuming ChromeDriver is in PATH)
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait a little for the page to load
    time.sleep(2)

    # Example interaction: find the search box by its name attribute
    search_box = driver.find_element(By.NAME, "q")
    search_box.send_keys("Selenium test example")
    
    # Submit the search
    search_box.submit()

    # Wait to see the results
    time.sleep(3)

finally:
    # Close the browser window
    driver.quit()
