#!/usr/bin/env python3
"""
Script to scrape page titles from a given URL using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup


def scrape_page_title(url):
    """
    Scrape the title of a web page given its URL.

    Args:
        url (str): The URL of the web page to scrape.

    Returns:
        str or None: The title of the page, or None if not found or on error.
    """
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()  # Raise an error for bad status codes

        soup = BeautifulSoup(response.text, 'html.parser')

        # Find the title tag
        title_tag = soup.find('title')

        if title_tag and title_tag.string:
            return title_tag.string.strip()
        else:
            return None

    except requests.exceptions.RequestException as e:
        print(f"Error fetching the URL: {e}")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None


if __name__ == "__main__":
    # Example usage
    url_to_scrape = input("Enter the URL to scrape the title from: ")
    title = scrape_page_title(url_to_scrape)

    if title:
        print(f"Page Title: {title}")
    else:
        print("Could not retrieve the page title.")
