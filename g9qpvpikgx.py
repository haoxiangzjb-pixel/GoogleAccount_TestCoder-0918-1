#!/usr/bin/env python3
"""
A Python script to scrape page titles from web pages using BeautifulSoup.
This script demonstrates how to extract titles from HTML documents.
"""

import requests
from bs4 import BeautifulSoup
import sys
import random
import string


def scrape_title_from_url(url):
    """
    Scrape the title from a given URL.
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The title of the page or None if not found
    """
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return None
            
    except requests.RequestException as e:
        print(f"Error fetching URL {url}: {e}")
        return None
    except Exception as e:
        print(f"Error parsing page {url}: {e}")
        return None


def scrape_title_from_html(html_content):
    """
    Scrape the title from raw HTML content.
    
    Args:
        html_content (str): The HTML content to parse
        
    Returns:
        str: The title of the page or None if not found
    """
    try:
        soup = BeautifulSoup(html_content, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return None
    except Exception as e:
        print(f"Error parsing HTML: {e}")
        return None


def main():
    """Main function to demonstrate the title scraping functionality."""
    print("Page Title Scraper using BeautifulSoup")
    print("=" * 40)
    
    # Example URLs to demonstrate the functionality
    sample_urls = [
        "https://httpbin.org/html",  # Simple HTML page
        "https://example.com",       # Common example site
    ]
    
    print("\nScraping titles from sample URLs:")
    for url in sample_urls:
        print(f"\nURL: {url}")
        title = scrape_title_from_url(url)
        if title:
            print(f"Title: {title}")
        else:
            print("Title: Not found or error occurred")
    
    # Example with raw HTML
    sample_html = """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Sample Page Title</title>
    </head>
    <body>
        <h1>This is a sample page</h1>
    </body>
    </html>
    """
    
    print(f"\nScraping title from sample HTML:")
    title = scrape_title_from_html(sample_html)
    print(f"Title: {title}")
    
    # If a URL is provided as a command-line argument, scrape that
    if len(sys.argv) > 1:
        url = sys.argv[1]
        print(f"\nScraping title from command-line URL: {url}")
        title = scrape_title_from_url(url)
        if title:
            print(f"Title: {title}")
        else:
            print("Could not retrieve title")


if __name__ == "__main__":
    main()