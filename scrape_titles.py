import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """
    Scrapes the title from a given URL.

    Args:
        url (str): The URL of the page to scrape.

    Returns:
        str: The title of the page, or an error message.
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "Title tag not found"
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {e}"
    except Exception as e:
        return f"An error occurred: {e}"

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraped_data_{random_string}.py"

if __name__ == "__main__":
    # Example URL; replace with the target URL
    url_to_scrape = "https://httpbin.org/html"  # A test page that usually has an HTML structure
    title = scrape_page_title(url_to_scrape)

    # Generate a random filename
    filename = generate_random_filename()

    # Write the result to the randomly named .py file
    with open(filename, 'w') as f:
        f.write(f"# Scraped data\n")
        f.write(f"title = '{title}'\n")

    print(f"Scraped title: {title}")
    print(f"Data saved to: {filename}")
