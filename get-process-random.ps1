# PowerShell script to get list of processes and save to a file with random name

# Generate a random filename using GUID to ensure uniqueness
$fileName = "processes_$(New-Guid).txt"

# Get the list of processes and export to the randomly named file
Get-Process | Out-File -FilePath $fileName

Write-Output "Process list saved to $fileName"