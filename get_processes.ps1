# PowerShell скрипт для получения списка процессов и сохранения в файл со случайным именем

# Генерируем случайное имя файла
$randomFileName = "processes_" + (Get-Random -Maximum 99999) + ".txt"

# Получаем список процессов и сохраняем в файл
Get-Process | Out-File -FilePath $randomFileName

Write-Host "Список процессов сохранен в файл: $randomFileName"