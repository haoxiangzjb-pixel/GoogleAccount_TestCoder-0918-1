# Генерация случайного имени файла
$randomName = -join ((65..90) + (97..122) | Get-Random -Count 8 | ForEach-Object {[char]$_})
$outputFile = ".\processes_$randomName.txt"

# Получение списка процессов и сохранение в файл
Get-Process | Select-Object Name, Id, CPU, WorkingSet, StartTime | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host "Список процессов сохранен в файл: $outputFile"
