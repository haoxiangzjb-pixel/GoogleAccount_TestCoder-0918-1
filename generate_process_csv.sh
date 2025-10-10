#!/bin/bash

# Генерируем случайное число для имени файла
random_num=$(( RANDOM % 10000 ))

# Имя файла
filename="processes_${random_num}.csv"

# Заголовок CSV
echo "Name,Id,Priority" > "$filename"

# Добавляем несколько фиктивных записей процесса
echo "process1,1234,Normal" >> "$filename"
echo "process2,5678,High" >> "$filename"
echo "process3,9012,Low" >> "$filename"

echo "Файл '$filename' создан с фиктивными данными процессов."