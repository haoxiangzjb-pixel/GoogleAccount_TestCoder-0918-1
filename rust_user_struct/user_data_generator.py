import json
import random
import string

# Определяем структуру пользователя (аналог Rust-структуры)
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

# Создаем экземпляр пользователя
user = User("John Doe", 30)

# Генерируем случайное имя файла
random_filename = "user_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".json"

# Сохраняем данные пользователя в JSON-файл
with open(random_filename, 'w') as file:
    json.dump({"name": user.name, "age": user.age}, file)

print(f"User data saved to file: {random_filename}")
print(f"User: {{name: {user.name}, age: {user.age}}}")