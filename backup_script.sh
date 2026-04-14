#!/bin/bash

# Скрипт для создания резервной копии файла со случайным именем

# Проверяем, передан ли файл в качестве аргумента
if [ $# -eq 0 ]; then
    echo "Ошибка: Не указан файл для резервного копирования."
    echo "Использование: $0 <имя_файла>"
    exit 1
fi

# Получаем имя файла из аргументов
SOURCE_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Ошибка: Файл '$SOURCE_FILE' не существует."
    exit 1
fi

# Генерируем случайное имя для резервной копии
RANDOM_STRING=$(head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 8)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${SOURCE_FILE}.backup_${TIMESTAMP}_${RANDOM_STRING}"

# Создаем резервную копию
cp "$SOURCE_FILE" "$BACKUP_FILE"

# Проверяем, успешно ли создана копия
if [ $? -eq 0 ]; then
    echo "Резервная копия успешно создана: $BACKUP_FILE"
else
    echo "Ошибка при создании резервной копии."
    exit 1
fi
