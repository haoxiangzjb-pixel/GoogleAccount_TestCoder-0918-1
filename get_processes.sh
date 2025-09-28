#!/bin/bash

# Генерация случайного имени файла
RANDOM_FILENAME=$(date +%s%N)_processes.txt

# Получение списка процессов и сохранение в файл
ps aux > "$RANDOM_FILENAME"

echo "Список процессов сохранен в файл: $RANDOM_FILENAME"