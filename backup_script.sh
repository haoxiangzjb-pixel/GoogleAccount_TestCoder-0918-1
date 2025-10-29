#!/bin/bash

# Функция для создания резервной копии файла с случайным именем
create_backup() {
    local source_file="$1"
    
    # Проверяем, существует ли исходный файл
    if [[ ! -f "$source_file" ]]; then
        echo "Ошибка: файл $source_file не существует"
        exit 1
    fi
    
    # Получаем директорию, в которой находится исходный файл
    local backup_dir=$(dirname "$source_file")
    
    # Генерируем случайное имя для резервной копии в той же директории
    local random_name=$(mktemp --dry-run --suffix=.bak)
    local filename=$(basename "$random_name")
    local final_backup_name="$backup_dir/$filename"
    
    # Создаем резервную копию файла
    cp "$source_file" "$final_backup_name"
    
    echo "Резервная копия файла создана: $final_backup_name"
}

# Проверяем, передан ли аргумент
if [[ $# -ne 1 ]]; then
    echo "Использование: $0 <путь_к_файлу_для_резервного_копирования>"
    exit 1
fi

# Вызываем функцию создания резервной копии
create_backup "$1"