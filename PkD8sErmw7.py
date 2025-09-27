import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_title(url):
    """Scrapes the title from a given URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No title tag found"
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None
    except Exception as e:
        print(f"An error occurred while parsing {url}: {e}")
        return None

def main():
    # Example URL list, you can modify this
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
    ]

    for url in urls:
        title = scrape_title(url)
        if title:
            print(f"Title for {url}: {title}")

if __name__ == "__main__":
    main()