from selenium import webdriver
from selenium.webdriver.firefox.service import Service as FirefoxService
from selenium.webdriver.common.by import By
from webdriver_manager.firefox import GeckoDriverManager
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Initialize the driver using GeckoDriverManager for Firefox
driver = webdriver.Firefox(service=FirefoxService(GeckoDriverManager().install()))

try:
    # Navigate to Google
    driver.get('https://www.google.com')

    # Wait a bit for the page to load
    time.sleep(2)

    # Get the page title as an example of interacting with the page
    title = driver.title
    print(f"Page title: {title}")

    # Example of saving a simple script to the random file
    script_content = f'''# This script was generated on {time.ctime()}
# It interacted with the page titled: {title}

print("Selenium test completed successfully!")
'''

    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Selenium test completed. A script was saved as {random_filename}.")

finally:
    # Close the browser
    driver.quit()
