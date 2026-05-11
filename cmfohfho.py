#!/usr/bin/env python3
"""
Script to scrape page titles using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup


def scrape_page_title(url):
    """
    Fetches a URL and extracts the page title.
    
    Args:
        url (str): The URL to scrape.
        
    Returns:
        str: The page title, or an error message if failed.
    """
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Try to find the title tag
        title_tag = soup.find('title')
        if title_tag and title_tag.string:
            return title_tag.string.strip()
        else:
            return "No title found on this page."
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {e}"
    except Exception as e:
        return f"Error parsing page: {e}"


if __name__ == "__main__":
    url = input("Enter the URL to scrape: ").strip()
    if url:
        title = scrape_page_title(url)
        print(f"\nPage Title: {title}")
    else:
        print("No URL provided.")
