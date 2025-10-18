import random
import string

def generate_random_filename():
    """Генерирует случайное имя файла с расширением .py"""
    letters_and_digits = string.ascii_letters + string.digits
    random_filename = ''.join(random.choice(letters_and_digits) for _ in range(10)) + '.py'
    return random_filename

def hello_function():
    """Функция, которая выводит 'Привет, мир!'"""
    print('Привет, мир!')

if __name__ == "__main__":
    # Генерируем случайное имя файла
    random_file_name = generate_random_filename()
    full_path = f'/workspace/{random_file_name}'
    
    # Записываем функцию в файл
    with open(full_path, 'w', encoding='utf-8') as file:
        file.write('def hello_function():\n    print("Привет, мир!")\n\nif __name__ == "__main__":\n    hello_function()\n')
    
    print(f'Функция сохранена в файл: {full_path}')