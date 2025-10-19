import uuid

# Генерация случайного имени файла
random_filename = f'/workspace/hello_world_{uuid.uuid4().hex}.py'

# Создание файла с функцией
with open(random_filename, 'w', encoding='utf-8') as file:
    file.write('def print_hello():\n    print(\'Привет, мир!\')\n\n# Вызов функции\nprint_hello()\n')

print(f'Файл создан: {random_filename}')