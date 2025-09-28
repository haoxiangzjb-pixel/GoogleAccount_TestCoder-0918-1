# Generated script to fetch data from https://jsonplaceholder.typicode.com/posts/1

import requests

def get_data():
    response = requests.get("https://jsonplaceholder.typicode.com/posts/1")
    response.raise_for_status()
    return response.json()

if __name__ == "__main__":
    data = get_data()
    print(data)

# Fetched Data (as a comment):
# {'userId': 1, 'id': 1, 'title': 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit', 'body': 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'}
