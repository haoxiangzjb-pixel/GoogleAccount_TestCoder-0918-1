import random
import string

def say_hello():
    print('Привет, мир!')

# Генерация случайного имени файла
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Сохранение функции в файл
with open(random_name, 'w', encoding='utf-8') as f:
    f.write('def say_hello():\n    print(\'Привет, мир!\')\n\n# Вызов функции\nsay_hello()\n')

print(f'Файл создан: {random_name}')