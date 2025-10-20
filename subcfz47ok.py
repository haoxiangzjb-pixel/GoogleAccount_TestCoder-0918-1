import requests
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
