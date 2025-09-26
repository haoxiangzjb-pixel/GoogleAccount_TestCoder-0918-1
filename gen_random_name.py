import random
import string
import os

def generate_random_filename(extension=".groovy"):
    """Генерирует случайное имя файла с указанным расширением."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{extension}"

# Генерируем случайное имя
random_filename = generate_random_filename()

# Путь к исходному файлу
source_file = '/workspace/filter_closure.groovy'
dest_file = f'/workspace/{random_filename}'

# Копируем содержимое
with open(source_file, 'r') as src, open(dest_file, 'w') as dst:
    dst.write(src.read())

print(f"Groovy closure saved to {dest_file}")