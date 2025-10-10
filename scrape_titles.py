"""
A simple web scraper to extract and print the title of a given webpage.
Demonstrates the use of requests and BeautifulSoup for basic HTML parsing.
"""

import requests
from bs4 import BeautifulSoup

def get_page_title(url: str) -> str:
    """
    Fetches a webpage and returns its title.

    Args:
        url: The URL of the webpage to scrape.

    Returns:
        The title of the webpage, or an error message if not found.
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')

        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "Title tag not found"

    except requests.exceptions.RequestException as e:
        return f"Error fetching the URL: {e}"

if __name__ == "__main__":
    # Example URL
    url = "https://httpbin.org/html"  # A test page that usually has an HTML structure

    title = get_page_title(url)
    print(f"The title of the page '{url}' is:")
    print(f"'{title}'")
