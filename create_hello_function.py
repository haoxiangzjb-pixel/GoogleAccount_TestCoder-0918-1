import random
import string

def generate_random_filename(length=10, extension='.py'):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f'{random_name}{extension}'

def hello_world_function():
    print('Привет, мир!')

random_filename = generate_random_filename()
with open(random_filename, 'w', encoding='utf-8') as f:
    f.write("def hello_world_function():\n    print('Привет, мир!')\n\n# Вызов функции\nhello_world_function()\n")

print(f'Файл создан: {random_filename}')