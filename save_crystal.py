import importlib.util
import uuid
import os

def save_crystal_class_to_random_file(source_file_path):
    """
    Загружает класс Crystal из указанного файла и сохраняет его определение
    в новый файл с случайным именем.
    
    Args:
        source_file_path (str): Путь к файлу, содержащему класс Crystal.
    """
    # 1. Загрузим модуль из файла
    spec = importlib.util.spec_from_file_location("crystal_module", source_file_path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    
    # 2. Получим исходный код класса Crystal
    # Мы будем считывать файл напрямую, чтобы получить точное определение
    with open(source_file_path, 'r', encoding='utf-8') as f:
        source_code = f.read()
    
    # 3. Извлечем только определение класса Crystal
    # Это простой способ, в реальном проекте лучше использовать парсер AST
    lines = source_code.splitlines()
    start_index = None
    end_index = None
    
    # Найдем начало класса
    for i, line in enumerate(lines):
        if line.strip().startswith("class Crystal:"):
            start_index = i
            break
    
    if start_index is None:
        raise ValueError("Класс Crystal не найден в исходном файле.")
    
    # Найдем конец класса (начало следующей функции верхнего уровня или конец файла)
    # С учетом отступов
    class_indent = ""
    for line in lines[start_index+1:]:
        if line.strip(): # Пропускаем пустые строки
            class_indent = line[:len(line) - len(line.lstrip())]
            break
            
    end_index = len(lines)
    for i, line in enumerate(lines[start_index+1:], start=start_index+1):
        # Если строка не пустая и имеет отступ меньше, чем у класса, или это другая конструкция верхнего уровня
        if line.strip() and not line.startswith(class_indent) and not line.startswith("#"):
             # Проверим, не является ли это началом другой функции/класса верхнего уровня
             if line.strip().startswith(("def ", "class ", "if __name__")):
                 end_index = i
                 break

    class_lines = lines[start_index:end_index]
    class_definition = "\n".join(class_lines)
    
    # 4. Сгенерируем случайное имя файла
    random_filename = f"Crystal_{uuid.uuid4().hex}.py"
    
    # 5. Запишем определение класса в новый файл
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(class_definition)
        
    print(f"Класс Crystal был успешно сохранен в новый файл: {random_filename}")

# --- Пример использования ---
# Предполагая, что исходный файл называется crystal_queue.py и находится в той же директории
source_path = "/workspace/crystal_queue.py"
save_crystal_class_to_random_file(source_path)