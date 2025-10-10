#!/bin/bash

# Проверяем, передан ли аргумент (путь к файлу)
if [ $# -ne 1 ]; then
    echo "Использование: $0 <путь_к_файлу>"
    exit 1
fi

ORIGINAL_FILE="$1"

# Проверяем, существует ли файл
if [ ! -f "$ORIGINAL_FILE" ]; then
    echo "Ошибка: Файл $ORIGINAL_FILE не существует."
    exit 1
fi

# Получаем директорию, в которой находится оригинальный файл
DIR=$(dirname "$ORIGINAL_FILE")

# Генерируем случайное имя файла, используя uuidgen
RANDOM_NAME=$(uuidgen)

# Получаем расширение оригинального файла
EXTENSION="${ORIGINAL_FILE##*.}"

# Формируем полный путь к резервной копии
BACKUP_PATH="$DIR/${RANDOM_NAME}.${EXTENSION}"

# Копируем файл
cp "$ORIGINAL_FILE" "$BACKUP_PATH"

echo "Файл $ORIGINAL_FILE скопирован в $BACKUP_PATH"