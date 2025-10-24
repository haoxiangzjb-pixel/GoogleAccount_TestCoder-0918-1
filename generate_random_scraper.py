#!/usr/bin/env python3
"""
Script to generate a randomly named Python file containing the web scraper.
"""

import random
import string
import os

def generate_random_filename(extension=".py"):
    """
    Generate a random filename with the given extension.
    
    Args:
        extension (str): File extension to use
        
    Returns:
        str: Randomly generated filename
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"scraper_{random_string}{extension}"

def main():
    # The content of our scraper script
    scraper_content = '''#!/usr/bin/env python3
"""
Web Scraper for Extracting Page Titles
This script uses BeautifulSoup to scrape page titles from a given URL.
"""

import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(url):
    """
    Scrape page titles from a given URL.
    
    Args:
        url (str): The URL to scrape titles from
        
    Returns:
        list: A list of page titles found on the page
    """
    try:
        # Send a GET request to the URL
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find all title tags
        titles = []
        title_tag = soup.find('title')
        if title_tag:
            titles.append(title_tag.get_text().strip())
        
        # Also look for h1, h2, h3 tags as they often contain important titles
        heading_tags = soup.find_all(['h1', 'h2', 'h3'])
        for tag in heading_tags:
            title_text = tag.get_text().strip()
            if title_text and title_text not in titles:
                titles.append(title_text)
        
        return titles
    
    except requests.RequestException as e:
        print(f"Error fetching the URL: {e}")
        return []
    except Exception as e:
        print(f"An error occurred: {e}")
        return []

def generate_random_filename(extension=".py"):
    """
    Generate a random filename with the given extension.
    
    Args:
        extension (str): File extension to use
        
    Returns:
        str: Randomly generated filename
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraped_titles_{random_string}{extension}"

def save_titles_to_file(titles, filename):
    """
    Save the scraped titles to a text file.
    
    Args:
        titles (list): List of titles to save
        filename (str): Name of the file to save titles to
    """
    with open(filename, 'w', encoding='utf-8') as file:
        for i, title in enumerate(titles, 1):
            file.write(f"{i}. {title}\\n")
    print(f"Titles saved to {filename}")

def main():
    # Example URL to scrape (you can change this)
    url = input("Enter the URL to scrape titles from (or press Enter for example.com): ").strip()
    if not url:
        url = "https://example.com"
    
    print(f"Scraping titles from {url}...")
    titles = scrape_page_titles(url)
    
    if titles:
        print(f"Found {len(titles)} title(s):")
        for i, title in enumerate(titles, 1):
            print(f"{i}. {title}")
        
        # Generate a random filename for the output
        output_filename = generate_random_filename(".txt")
        save_titles_to_file(titles, output_filename)
    else:
        print("No titles found or error occurred.")

if __name__ == "__main__":
    main()
'''

    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the scraper content to the randomly named file
    with open(random_filename, 'w', encoding='utf-8') as file:
        file.write(scraper_content)
    
    print(f"Randomly named scraper file created: {random_filename}")

if __name__ == "__main__":
    main()