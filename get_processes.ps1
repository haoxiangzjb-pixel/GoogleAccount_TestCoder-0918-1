# PowerShell script to get list of processes and save to a file with random name
$processes = Get-Process
$randomFileName = "processes_" + (Get-Random -Maximum 99999) + ".csv"
$processes | Export-Csv -Path $randomFileName -NoTypeInformation
Write-Host "Process list saved to $randomFileName"