import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """Scrapes the title from a given URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No title found"
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None

def main():
    # Example URL, replace with the target URL
    url = 'https://httpbin.org/html'  # A test page that usually has a title
    title = scrape_page_title(url)
    
    if title:
        print(f"Scraped Title: {title}")
        
        # Generate a random filename
        random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
        print(f"Saving script to: {random_filename}")
        
        # This script saves *itself* to the random filename
        with open(random_filename, 'w') as f:
            f.write('#!/usr/bin/env python3\n')
            f.write('# Auto-generated web scraper\n\n')
            f.write('import requests\n')
            f.write('from bs4 import BeautifulSoup\n\n')
            f.write('def scrape_page_title(url):\n')
            f.write('    """Scrapes the title from a given URL."""\n')
            f.write('    try:\n')
            f.write('        response = requests.get(url)\n')
            f.write('        response.raise_for_status()\n')
            f.write('        soup = BeautifulSoup(response.text, \'html.parser\')\n')
            f.write('        title_tag = soup.find(\'title\')\n')
            f.write('        if title_tag:\n')
            f.write('            return title_tag.get_text(strip=True)\n')
            f.write('        else:\n')
            f.write('            return "No title found"\n')
            f.write('    except requests.exceptions.RequestException as e:\n')
            f.write('        print(f"Error fetching {url}: {e}")\n')
            f.write('        return None\n\n')
            f.write(f"title = scrape_page_title('{url}')\n")
            f.write('if title:\n')
            f.write('    print(f"Scraped Title: {title}")\n')

if __name__ == "__main__":
    main()
