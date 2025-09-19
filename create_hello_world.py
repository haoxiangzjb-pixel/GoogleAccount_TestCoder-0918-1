import random
import string

def generate_random_filename(length=8):
    """Генерирует случайное имя файла"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + '.py'

def create_hello_world_script():
    """Создает скрипт Python, который выводит 'Привет, мир!'"""
    # Генерируем случайное имя файла
    filename = generate_random_filename()
    
    # Создаем содержимое файла
    content = "def hello_world():\n    print('Привет, мир!')\n\nif __name__ == '__main__':\n    hello_world()\n"
    
    # Записываем содержимое в файл
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"Скрипт сохранен в файл: {filename}")
    return filename

# Создаем файл
filename = create_hello_world_script()