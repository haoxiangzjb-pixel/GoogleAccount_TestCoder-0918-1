from selenium import webdriver
import time

driver = webdriver.Chrome()
try:
    driver.get("https://www.google.com")
    time.sleep(5) # Wait 5 seconds to see the page
finally:
    driver.quit()
