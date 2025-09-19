import requests
from bs4 import BeautifulSoup
import random
import string
import os
import sys

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraper_{random_chars}.py"

def scrape_page_title(url):
    """Scrape and return the title of a webpage"""
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    try:
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except Exception as e:
        return f"Error: {str(e)}"

def create_random_copy():
    """Create a copy of this script with a random filename"""
    # Get the current script's path
    current_script = os.path.abspath(__file__)
    
    # Generate a random filename
    random_name = generate_random_filename()
    
    # Read the current script content
    with open(current_script, 'r') as f:
        content = f.read()
    
    # Write to the new file
    with open(random_name, 'w') as f:
        f.write(content)
    
    print(f"Created a copy of this script as: {random_name}")
    return random_name

def main():
    # Create a random copy of the script
    random_copy = create_random_copy()
    
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://httpbin.org/html",  # A test site that should work
        "https://www.google.com"
    ]
    
    print("\nScraping page titles:")
    print("-" * 40)
    
    for url in urls:
        title = scrape_page_title(url)
        print(f"{url}: {title}")

if __name__ == "__main__":
    main()