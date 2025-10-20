# PowerShell script to get a list of processes and save to a file with a random name

# Get the list of processes
$processes = Get-Process

# Generate a random filename
$randomName = "processes_" + (Get-Random -Maximum 99999) + ".txt"

# Save the processes to the file
$processes | Out-File -FilePath $randomName

Write-Host "Process list saved to: $randomName"