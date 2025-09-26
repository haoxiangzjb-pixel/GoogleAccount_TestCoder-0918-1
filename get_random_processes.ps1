# PowerShell script to get processes and save to a file with a random name
$randomNumber = Get-Random
$outputFileName = "processes_$randomNumber.txt"
Get-Process | Out-File -FilePath $outputFileName
Write-Host "Process list saved to $outputFileName"