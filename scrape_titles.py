import requests
from bs4 import BeautifulSoup
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

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
            
            # Find the title tag
            title_tag = soup.find('title')
            title = title_tag.get_text().strip() if title_tag else "No title found"
            
            results.append((url, title))
            
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            results.append((url, f"Error: {e}"))
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            results.append((url, f"Error: {e}"))
    
    return results

def save_titles_to_file(titles_data, filename):
    """
    Save the scraped titles to a Python file
    
    Args:
        titles_data (list): List of tuples containing (url, title)
        filename (str): Name of the file to save data to
    """
    with open(filename, 'w', encoding='utf-8') as f:
        f.write("# Scraped Page Titles\n")
        f.write("page_titles = [\n")
        
        for url, title in titles_data:
            f.write(f"    ('{url}', '{title}'),\n")
        
        f.write("]\n\n")
        f.write("if __name__ == '__main__':\n")
        f.write("    for url, title in page_titles:\n")
        f.write("        print(f'URL: {url}')\n")
        f.write("        print(f'Title: {title}')\n")
        f.write("        print('-' * 50)\n")

def main():
    # Example URLs to scrape
    urls = [
        'https://httpbin.org/html',  # Test page with HTML
        'https://example.com',
        'https://httpbin.org/json'   # This will likely have no title
    ]
    
    print("Scraping page titles...")
    titles = scrape_page_titles(urls)
    
    # Generate random filename
    random_filename = generate_random_filename()
    
    # Save results to the randomly named file
    save_titles_to_file(titles, random_filename)
    
    print(f"Results saved to {random_filename}")
    
    # Print results
    for url, title in titles:
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)

if __name__ == '__main__':
    main()