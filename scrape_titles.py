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
    except requests.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None

def main():
    # Example URL, replace with the target URL
    url = "https://httpbin.org/html"  # A test page that usually has an HTML structure
    title = scrape_page_title(url)
    
    if title:
        print(f"Title of the page: {title}")
        
        # Generate a random filename
        random_filename = "scraping_script_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"
        print(f"Saving script to: {random_filename}")

        # Save this script to the random filename
        with open(__file__, 'r') as source_file:
            source_code = source_file.read()

        with open(random_filename, 'w') as target_file:
            target_file.write(source_code)

if __name__ == "__main__":
    main()
