import random
import string

def generate_random_filename(length=10, extension='.py'):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + extension

def greet():
    print('Привет, мир!')

filename = generate_random_filename()
with open(filename, 'w') as f:
    f.write('def greet():\n    print(\"Привет, мир!\")\n\ngreet()  # Вызов функции для демонстрации\n')

print(f'Файл создан: {filename}')