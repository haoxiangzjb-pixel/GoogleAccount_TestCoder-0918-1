import uuid

def print_hello():
    print('Привет, мир!')

# Генерация случайного имени файла
random_filename = f'hello_world_{uuid.uuid4().hex}.py'

# Сохранение функции в файл с случайным именем
with open(random_filename, 'w', encoding='utf-8') as file:
    file.write("def print_hello():\n    print('Привет, мир!')\n\n# Вызов функции\nprint_hello()\n")

# Вызов функции из текущего файла
print_hello()