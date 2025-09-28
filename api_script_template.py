import requests
import json
import random
import string

def random_filename(ext='.py', length=8):
    """Generate a random filename."""
    letters = string.ascii_lowercase
    random_part = ''.join(random.choice(letters) for i in range(length))
    return f"{random_part}{ext}"

# Example API call
url = "https://jsonplaceholder.typicode.com/posts/1"
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    
    # Generate a random filename
    filename = random_filename()
    
    # Save the response data to the random file
    with open(filename, 'w') as f:
        json.dump(data, f, indent=4)
    
    print(f"Data saved to {filename}")
else:
    print(f"Failed to retrieve data: {response.status_code}")
