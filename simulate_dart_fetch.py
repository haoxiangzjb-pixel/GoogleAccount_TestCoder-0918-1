import httpx
import random
import string
import os

async def fetch_and_save_dart_data(url: str, output_dir: str):
    """
    Asynchronously fetches data from a URL and saves it as a randomly named .dart file.

    Args:
        url (str): The URL to fetch data from.
        output_dir (str): The directory to save the generated .dart file.
    """
    try:
        print(f"Fetching data from {url}...")
        async with httpx.AsyncClient() as client:
            response = await client.get(url)
            response.raise_for_status()  # Raise an exception for bad status codes

        # Generate a random file name
        random_filename = "".join(random.choices(string.ascii_letters + string.digits, k=10)) + ".dart"
        file_path = os.path.join(output_dir, random_filename)

        print(f"Saving data to {file_path}...")
        # Wrap the fetched data in a simple Dart main function as a string
        dart_content = f"void main() {{\n  // Fetched data from {url}\n  String data = '''{response.text}''';\n  print(data);\n}}"
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(dart_content)

        print(f"Data successfully fetched and saved to {file_path}")
        return file_path

    except httpx.RequestError as e:
        print(f"An HTTP error occurred while fetching data: {e}")
        raise
    except OSError as e:
        print(f"An OS error occurred while writing the file: {e}")
        raise
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        raise

# Example usage
if __name__ == "__main__":
    import asyncio
    URL = "https://api.github.com/users/octocat" # Using a more stable API
    OUTPUT_DIR = "/workspace"
    asyncio.run(fetch_and_save_dart_data(URL, OUTPUT_DIR))