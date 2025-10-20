import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    """
    titles = []
    
    for url in urls:
        try:
            # Add protocol if missing
            if not url.startswith(('http://', 'https://')):
                url = 'https://' + url
            
            response = requests.get(url)
            response.raise_for_status()  # Raise an exception for bad status codes
            
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Find the title tag
            title_tag = soup.find('title')
            if title_tag:
                title = title_tag.get_text().strip()
            else:
                title = "No title found"
            
            titles.append({
                'url': url,
                'title': title
            })
            
            print(f"Scraped: {url} -> {title}")
        
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            titles.append({
                'url': url,
                'title': f"Error: {e}"
            })
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            titles.append({
                'url': url,
                'title': f"Error: {e}"
            })
    
    return titles

def generate_random_filename():
    """
    Generate a random Python filename
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Example URLs to scrape
    urls = [
        'https://httpbin.org/html',  # Test page with HTML
        'https://example.com',
        'https://httpbin.org/json'   # This might not have a title
    ]
    
    print("Starting to scrape page titles...")
    titles_data = scrape_page_titles(urls)
    
    print("\nScraped titles:")
    for item in titles_data:
        print(f"URL: {item['url']}")
        print(f"Title: {item['title']}\n")
    
    # Generate random filename and save the script
    random_filename = generate_random_filename()
    
    # Save just the scraping function to the random file
    script_content = '''import requests
from bs4 import BeautifulSoup

def scrape_single_page_title(url):
    """
    Scrape the title from a single URL
    """
    try:
        if not url.startswith(('http://', 'https://')):
            url = 'https://' + url
        
        response = requests.get(url)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.text, 'html.parser')
        
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    
    except Exception as e:
        return f"Error: {e}"

# Example usage
if __name__ == "__main__":
    url = input("Enter URL to scrape title from: ")
    title = scrape_single_page_title(url)
    print(f"Title: {title}")
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")

if __name__ == "__main__":
    main()