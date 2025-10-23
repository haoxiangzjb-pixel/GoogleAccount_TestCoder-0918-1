# PowerShell script to get list of processes and save to a file with random name
$randomFileName = "processes_" + (Get-Random -Maximum 999999) + ".txt"
Get-Process | Out-File -FilePath $randomFileName
Write-Host "Process list saved to $randomFileName"