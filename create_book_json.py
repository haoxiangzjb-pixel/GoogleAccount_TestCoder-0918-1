import json
import random

# Данные о книге
data = {
    "title": "The Great Gatsby",
    "author": "F. Scott Fitzgerald",
    "year": 1925,
    "isbn": "978-0-7432-7356-5"
}

# Генерация случайного имени файла
filename = f"book_{random.randint(1000, 9999)}.json"

# Сохранение данных в JSON-файл
with open(filename, 'w') as f:
    json.dump(data, f)

print(f"Created file: {filename}")
