# PowerShell script to get process list and save to a file with a random name
$randomName = "$(Get-Random -Maximum 99999999)"
$fileName = "${randomName}.csv"
Get-Process | Export-Csv -Path $fileName -NoTypeInformation
Write-Host "Process list saved to $fileName"