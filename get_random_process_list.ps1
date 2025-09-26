# Генерация случайного имени файла
$randomFileName = "process_list_" + (Get-Random -Maximum 10000) + ".csv"

# Получение списка процессов и экспорт в CSV с случайным именем файла
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Host "Список процессов сохранен в файл: $randomFileName"