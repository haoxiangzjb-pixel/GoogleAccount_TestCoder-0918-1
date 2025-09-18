#!/usr/bin/env python3
"""
Simple Web Page Title Scraper
This script takes a URL as a command line argument and prints its title.
"""

import requests
from bs4 import BeautifulSoup
import sys

def scrape_page_title(url):
    """Scrape and return the title of a webpage."""
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    try:
        response = requests.get(url, timeout=10, headers=headers)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        return title_tag.get_text().strip() if title_tag else "No title found"
    except Exception as e:
        return f"Error: {e}"

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 simple_title_scraper.py <URL>")
        sys.exit(1)
    
    url = sys.argv[1]
    title = scrape_page_title(url)
    print(f"Title of {url}: {title}")