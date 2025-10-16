import random
import string

def print_hello():
    print('Привет, мир!')

# Генерация случайного имени файла
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.py'

# Сохранение функции в файл с случайным именем
with open(f'/workspace/{random_filename}', 'w', encoding='utf-8') as f:
    f.write("def print_hello():\n    print('Привет, мир!')\n")

# Вызов функции
print_hello()