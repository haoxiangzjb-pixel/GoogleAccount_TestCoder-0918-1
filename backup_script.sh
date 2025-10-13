#!/bin/bash

# Проверяем, передан ли аргумент
if [ $# -ne 1 ]; then
  echo "Использование: $0 <путь_к_файлу_для_резервного_копирования>"
  exit 1
fi

# Сохраняем путь к файлу
FILE_TO_BACKUP="$1"

# Проверяем, существует ли файл
if [ ! -f "$FILE_TO_BACKUP" ]; then
  echo "Ошибка: Файл $FILE_TO_BACKUP не существует."
  exit 1
fi

# Генерируем случайное имя для файла резервной копии
BACKUP_NAME=$(mktemp --suffix=.bak)

# Создаем резервную копию
cp "$FILE_TO_BACKUP" "$BACKUP_NAME"

echo "Резервная копия создана: $BACKUP_NAME"