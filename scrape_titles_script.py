import requests
from bs4 import BeautifulSoup
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scrape_titles_{random_chars}.py"

def scrape_page_titles(url):
    """Scrape all page titles from a given URL"""
    try:
        # Send GET request to the URL
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find all title tags
        titles = soup.find_all('title')
        
        # Extract text from title tags
        title_texts = [title.get_text().strip() for title in titles]
        
        return title_texts
    except requests.RequestException as e:
        print(f"Error fetching the URL: {e}")
        return []
    except Exception as e:
        print(f"Error parsing HTML: {e}")
        return []

def main():
    # Example URL - replace with your target URL
    url = "https://example.com"
    
    print(f"Scraping titles from: {url}")
    titles = scrape_page_titles(url)
    
    if titles:
        print("Found titles:")
        for i, title in enumerate(titles, 1):
            print(f"{i}. {title}")
    else:
        print("No titles found or error occurred.")
        
    # Save to a randomly named file
    filename = generate_random_filename()
    with open(filename, 'w') as f:
        f.write("# Scraped Titles\n")
        for title in titles:
            f.write(f"{title}\n")
    
    print(f"Results saved to {filename}")

if __name__ == "__main__":
    main()