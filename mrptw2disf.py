# Scraped Page Titles
page_titles = [
    ('https://httpbin.org/html', 'Error: 503 Server Error: Service Temporarily Unavailable for url: https://httpbin.org/html'),
    ('https://example.com', 'Example Domain'),
    ('https://httpbin.org/json', 'Error: 503 Server Error: Service Temporarily Unavailable for url: https://httpbin.org/json'),
]

if __name__ == '__main__':
    for url, title in page_titles:
        print(f'URL: {url}')
        print(f'Title: {title}')
        print('-' * 50)
