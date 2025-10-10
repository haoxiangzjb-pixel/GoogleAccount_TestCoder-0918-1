import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
  """Scrapes the title from a given URL."""
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes
    soup = BeautifulSoup(response.text, 'html.parser')
    title_tag = soup.find('title')
    if title_tag:
      return title_tag.get_text(strip=True)
    else:
      return "No title tag found"
  except requests.exceptions.RequestException as e:
    print(f"Error fetching {url}: {e}")
    return None
  except Exception as e:
    print(f"An error occurred while scraping {url}: {e}")
    return None

if __name__ == "__main__":
  # Example URL, replace with the target URL
  target_url = "https://httpbin.org/html"  # A test page that often has a title

  title = scrape_page_title(target_url)
  if title:
    print(f"Title of {target_url} is: {title}")

    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".py"
    print(f"Saving script to {random_filename}...")

    # Save this script to the random filename
    with open(__file__, 'r') as source_file:
      script_content = source_file.read()

    with open(random_filename, 'w') as target_file:
      target_file.write(script_content)

    print(f"Script saved successfully to {random_filename}!")
  else:
    print("Could not scrape the title.")
