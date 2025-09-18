import requests
from bs4 import BeautifulSoup
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraper_{random_chars}.py"

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        response = requests.get(url)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text()
        else:
            return "No title found"
    except Exception as e:
        return f"Error: {str(e)}"

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://httpbin.org/json"
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}\n")

if __name__ == "__main__":
    # Generate and print a random filename
    filename = generate_random_filename()
    print(f"Random filename: {filename}")
    main()