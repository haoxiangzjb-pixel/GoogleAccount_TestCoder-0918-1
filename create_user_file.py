import json
import random
import string
import os

# Определяем структуру, аналогичную структуре Rust
user_data = {
    "name": "Alice",
    "age": 30
}

# Генерируем случайное имя файла
random_filename = "user_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + ".json"

# Сохраняем структуру в файл
with open(random_filename, 'w', encoding='utf-8') as f:
    json.dump(user_data, f, ensure_ascii=False)

print(f"Структура пользователя сохранена в файл: {random_filename}")

# Также создадим файл с описанием структуры Rust
rust_struct_code = '''#[derive(Serialize, Deserialize, Debug)]
struct User {
    name: String,
    age: u32,
}'''

with open("user_struct_definition.txt", "w", encoding='utf-8') as f:
    f.write(rust_struct_code)

print("Определение структуры Rust сохранено в файл: user_struct_definition.txt")