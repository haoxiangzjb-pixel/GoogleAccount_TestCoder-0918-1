"""
A simple web scraper to extract and print the titles of web pages.
"""
import requests
from bs4 import BeautifulSoup


def get_page_title(url):
    """
    Fetches the title of the web page at the given URL.

    Args:
        url (str): The URL of the web page.

    Returns:
        str: The title of the web page, or an error message if retrieval fails.
    """
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)

        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')

        if title_tag:
            # Get the text content of the title tag and strip whitespace
            return title_tag.get_text(strip=True)
        else:
            return "No <title> tag found"

    except requests.exceptions.RequestException as e:
        # Handle any request-related errors (e.g., network issues, invalid URL)
        return f"Error fetching URL: {e}"


if __name__ == "__main__":
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",  # A simple test page with a title
        "https://example.com",
        "https://httpbin.org/json"   # This page might not have a standard HTML title
    ]

    print("Scraping page titles...")
    for url in urls:
        title = get_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}\n")
