#!/usr/bin/env python3
"""
Web scraper to extract page titles from URLs using BeautifulSoup
"""
import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    
    Args:
        urls (list): List of URLs to scrape titles from
    
    Returns:
        list: List of tuples containing (url, title)
    """
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    results = []
    
    for url in urls:
        try:
            # Send GET request to the URL
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Raise an exception for bad status codes
            
            # Parse the HTML content
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Extract the page title
            title_tag = soup.find('title')
            title = title_tag.get_text().strip() if title_tag else 'No title found'
            
            results.append((url, title))
            
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            results.append((url, f"Error: {e}"))
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            results.append((url, f"Error: {e}"))
    
    return results

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"scraper_{random_string}{extension}"

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://httpbin.org/robots.txt"  # This won't have a title
    ]
    
    print("Scraping page titles...")
    titles = scrape_page_titles(urls)
    
    print("\nResults:")
    for url, title in titles:
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)

if __name__ == "__main__":
    main()