import json
import random
import string

# Определяем структуру пользователя (в Python это будет словарь)
user = {
    "name": "Alice",
    "age": 30
}

# Генерируем случайное имя файла
random_filename = "user_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".json"

# Сохраняем структуру в файл
with open(random_filename, 'w') as f:
    json.dump(user, f)

print(f"Структура пользователя сохранена в файл: {random_filename}")