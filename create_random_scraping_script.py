#!/usr/bin/env python3
"""
Script to create a Python script using BeautifulSoup to scrape page titles
and save it to a randomly named .py file.
"""

import random
import string
import os

def generate_random_filename(extension=".py"):
    """
    Generate a random filename with the given extension
    
    Args:
        extension (str): File extension to use
    
    Returns:
        str: Random filename
    """
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_name}{extension}"

def create_scraping_script():
    """
    Create the BeautifulSoup scraping script content
    """
    script_content = '''#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a given URL using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(url):
    """
    Scrape page titles from a given URL
    
    Args:
        url (str): The URL to scrape
    
    Returns:
        list: A list of page titles found on the page
    """
    try:
        # Send GET request to the URL
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
        
        # Find other heading tags that might contain titles
        for tag_name in ['h1', 'h2', 'h3', 'h4', 'h5', 'h6']:
            for tag in soup.find_all(tag_name):
                title_text = tag.get_text().strip()
                if title_text:
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
    Generate a random filename with the given extension
    
    Args:
        extension (str): File extension to use
    
    Returns:
        str: Random filename
    """
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_name}{extension}"

def main():
    # Example URL to scrape (you can change this)
    url = input("Enter the URL to scrape page titles from (or press Enter for example.com): ").strip()
    if not url:
        url = "https://example.com"
    
    print(f"Scraping page titles from: {url}")
    titles = scrape_page_titles(url)
    
    if titles:
        print(f"\\nFound {len(titles)} title(s):")
        for i, title in enumerate(titles, 1):
            print(f"{i}. {title}")
    else:
        print("No titles found or an error occurred.")
    
    # Generate random filename and save results
    random_filename = generate_random_filename(".txt")
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(f"Page titles scraped from: {url}\\n")
        f.write(f"Total titles found: {len(titles)}\\n\\n")
        for i, title in enumerate(titles, 1):
            f.write(f"{i}. {title}\\n")
    
    print(f"\\nResults saved to: {random_filename}")

if __name__ == "__main__":
    main()
'''
    return script_content

def main():
    # Generate a random filename
    random_filename = generate_random_filename(".py")
    
    # Get the script content
    script_content = create_scraping_script()
    
    # Write the script to the randomly named file
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(script_content)
    
    print(f"Created BeautifulSoup scraping script: {random_filename}")

if __name__ == "__main__":
    main()