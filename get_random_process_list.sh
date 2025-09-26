#!/bin/bash

# Генерация случайного имени файла
random_file_name="process_list_${RANDOM}.txt"

# Получение списка процессов и сохранение в файл
ps aux > "$random_file_name"

echo "Список процессов сохранен в файл: $random_file_name"