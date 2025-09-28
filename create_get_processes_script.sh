#!/bin/bash

# Генерация случайного имени файла
RANDOM_FILENAME=$(date +%s%N)_processes.txt

# Создание PowerShell-скрипта с использованием случайного имени
cat << EOF > get_processes_${RANDOM_FILENAME}.ps1
Get-Process | Out-File -FilePath "$RANDOM_FILENAME"
EOF

echo "Создан скрипт PowerShell с именем файла $RANDOM_FILENAME"