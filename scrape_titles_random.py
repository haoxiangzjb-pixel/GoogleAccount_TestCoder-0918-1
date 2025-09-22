import requests
from bs4 import BeautifulSoup
import random
import string

def generate_random_filename(length=10):
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"{random_name}.py"

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        # Send GET request to the URL with headers to appear more like a browser
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except Exception as e:
        return f"Error scraping {url}: {str(e)}"

def main():
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"{url} - Title: {title}")

if __name__ == "__main__":
    # Generate a random filename
    filename = generate_random_filename()
    print(f"Script is running from file: {filename}")
    main()