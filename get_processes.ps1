# PowerShell script to get processes and save to a file with a random name
$processes = Get-Process
$fileName = "processes_$(New-Guid).csv"
$processes | Export-Csv -Path $fileName -NoTypeInformation
Write-Host "Process list saved to $fileName"