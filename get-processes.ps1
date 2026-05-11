# Скрипт PowerShell для получения списка процессов и сохранения в файл со случайным именем

# Генерируем случайное имя файла
$randomName = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 8 | ForEach-Object {[char]$_})
$fileName = "processes_$randomName.txt"

# Получаем список процессов и сохраняем в файл
Get-Process | Out-File -FilePath $fileName -Encoding UTF8

# Выводим имя созданного файла
Write-Host "Список процессов сохранен в файл: $fileName"
