#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script uses BeautifulSoup to scrape titles from web pages.
"""

import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse
import sys

def scrape_page_title(url):
    """
    Scrape the title of a webpage.
    
    Args:
        url (str): The URL of the webpage to scrape.
        
    Returns:
        str: The title of the webpage or an error message.
    """
    # Set a user agent to mimic a regular browser
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    try:
        # Send a GET request to the URL with headers
        response = requests.get(url, timeout=10, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Extract the title
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching page: {e}"
    except Exception as e:
        return f"Error parsing page: {e}"

def main():
    """
    Main function to run the scraper.
    """
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://www.stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    print("Web Page Title Scraper")
    print("=" * 30)
    
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 30)

if __name__ == "__main__":
    main()