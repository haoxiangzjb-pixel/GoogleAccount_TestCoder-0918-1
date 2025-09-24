import psutil
import csv
import random

# Генерируем случайное имя файла
random_file_name = f"processes_{random.randint(0, 10000)}.csv"

# Получаем список процессов
processes = []
for proc in psutil.process_iter(['pid', 'name', 'cpu_percent', 'memory_info']):
    try:
        # Получаем информацию о процессе
        process_info = proc.info
        processes.append({
            'Name': process_info['name'],
            'Id': process_info['pid'],
            'CPU': process_info['cpu_percent'],
            'WorkingSet': process_info['memory_info'].rss  # Используем RSS (Resident Set Size) для WorkingSet
        })
    except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
        # Игнорируем процессы, которые завершились или недоступны
        pass

# Сохраняем список процессов в CSV-файл
with open(random_file_name, mode='w', newline='', encoding='utf-8') as file:
    fieldnames = ['Name', 'Id', 'CPU', 'WorkingSet']
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    writer.writeheader()
    for proc in processes:
        writer.writerow(proc)

print(f"Список процессов сохранен в файл: {random_file_name}")