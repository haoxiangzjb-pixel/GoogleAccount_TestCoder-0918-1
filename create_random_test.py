import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + ".py"

# Content for the Selenium test
selenium_test_content = '''from selenium import webdriver
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
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(selenium_test_content)

print(f"Selenium test script written to {random_filename}")
