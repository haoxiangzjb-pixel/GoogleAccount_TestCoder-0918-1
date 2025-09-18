import requests
from bs4 import BeautifulSoup
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraper_{random_chars}.py"

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except requests.exceptions.RequestException as e:
        return f"Network error: {str(e)}"
    except Exception as e:
        return f"Error: {str(e)}"

def save_script_with_random_name():
    """Save this script with a random filename"""
    filename = generate_random_filename()
    # Get the current script's content
    with open(__file__, 'r') as f:
        content = f.read()
    
    # Save to new file with random name
    with open(filename, 'w') as f:
        f.write(content)
    
    return filename

def main():
    # Example URLs to scrape (more reliable ones)
    urls = [
        "https://www.python.org",
        "https://www.wikipedia.org",
        "https://github.com"
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}\n")

if __name__ == "__main__":
    # Generate a random filename and save the script
    new_filename = save_script_with_random_name()
    print(f"Script saved with random filename: {new_filename}")
    main()