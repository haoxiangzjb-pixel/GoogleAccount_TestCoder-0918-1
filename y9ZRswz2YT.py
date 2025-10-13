from selenium import webdriver
from selenium.webdriver.common.by import By

# Initialize the Chrome WebDriver
driver = webdriver.Chrome()

try:
    # Navigate to Google
    driver.get("https://www.google.com")
    print(f"Opened Google: {driver.current_url}")

finally:
    # Close the browser
    driver.quit()
