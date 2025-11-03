# PowerShell script to get a list of processes and save to a file with a random name

# Generate a random filename
$randomName = "processes_" + (Get-Random -Maximum 99999) + ".txt"

# Get the list of processes and save to the file with the random name
Get-Process | Out-File -FilePath $randomName

Write-Output "Process list saved to file: $randomName"