#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a list of URLs using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import csv
import time
import random
from urllib.parse import urljoin, urlparse


def scrape_page_title(url):
    """
    Scrape the title of a webpage given its URL.
    
    Args:
        url (str): The URL of the webpage to scrape
        
    Returns:
        str: The title of the webpage or an error message
    """
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Try to find the title tag
        title_tag = soup.find('title')
        
        if title_tag:
            title = title_tag.get_text().strip()
            return title
        else:
            # If no title tag found, return a default message
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {str(e)}"
    except Exception as e:
        return f"Error parsing page: {str(e)}"


def scrape_multiple_pages(urls, output_file='scraped_titles.csv'):
    """
    Scrape titles from multiple URLs and save to a CSV file.
    
    Args:
        urls (list): List of URLs to scrape
        output_file (str): Name of the output CSV file
    """
    results = []
    
    for i, url in enumerate(urls):
        print(f"Scraping {i+1}/{len(urls)}: {url}")
        title = scrape_page_title(url)
        results.append({'URL': url, 'Title': title})
        
        # Add a small delay to be respectful to the servers
        time.sleep(random.uniform(0.5, 1.5))
    
    # Write results to CSV
    with open(output_file, 'w', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['URL', 'Title']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        
        writer.writeheader()
        for result in results:
            writer.writerow(result)
    
    print(f"Scraping completed! Results saved to {output_file}")
    return results


def main():
    """
    Main function to demonstrate the web scraper.
    """
    # Example URLs to scrape
    urls = [
        'https://httpbin.org/html',  # Test page
        'https://example.com',
        'https://httpbin.org/robots.txt',  # This will likely not have a title
    ]
    
    print("Starting web scraping for page titles...")
    results = scrape_multiple_pages(urls)
    
    # Print results
    print("\nScraped Titles:")
    print("-" * 50)
    for result in results:
        print(f"URL: {result['URL']}")
        print(f"Title: {result['Title']}")
        print("-" * 50)


if __name__ == "__main__":
    main()