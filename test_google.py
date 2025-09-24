from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# This script requires a browser (like Firefox or Chrome) to be installed and available.
# In headless environments, this will fail unless specific headless options are configured.
# The code below shows the correct structure for a Selenium test opening Google.

try:
    # Initialize the Firefox WebDriver using webdriver-manager
    service = Service(GeckoDriverManager().install())
    driver = webdriver.Firefox(service=service)

    # Navigate to Google
    driver.get("https://www.google.com")

    # Wait a little for the page to load
    time.sleep(2)

    # Example interaction: find the search box
    search_box = driver.find_element(By.NAME, "q")
    print(f"Found search box on {driver.current_url}")

    # Optionally, interact with the page (e.g., type a search query)
    # search_box.send_keys("Selenium test")
    # search_box.send_keys(Keys.RETURN)

    # Save a simple script that opens Google to the randomly named file
    script_content = '''from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager

service = Service(GeckoDriverManager().install())
driver = webdriver.Firefox(service=service)
driver.get("https://www.google.com")
# Remember to call driver.quit() when done
# driver.quit()
'''

    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Selenium script saved to {random_filename}")

except Exception as e:
    print(f"Selenium test failed: {e}")
    print("This is likely because a browser is not installed or not accessible in this environment.")
    # Generate a random filename anyway
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    script_content = '''# This script requires a browser (like Firefox or Chrome) to run successfully.
# You need to install a browser and the corresponding WebDriver (e.g., geckodriver for Firefox).
from selenium import webdriver
# Example for Firefox:
# from selenium.webdriver.firefox.service import Service
# from webdriver_manager.firefox import GeckoDriverManager
# service = Service(GeckoDriverManager().install())
# driver = webdriver.Firefox(service=service)
# driver.get("https://www.google.com")
# driver.quit()
'''
    with open(random_filename, 'w') as f:
        f.write(script_content)
    print(f"Example script saved to {random_filename} (will not run without a browser).")
