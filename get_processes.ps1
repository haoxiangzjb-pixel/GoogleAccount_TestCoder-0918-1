# PowerShell script to get a list of processes and save it to a file with a random name

# Get the list of processes
$processes = Get-Process

# Generate a random file name
$randomFileName = [System.IO.Path]::GetRandomFileName() + ".txt"

# Save the processes list to the file
$processes | Out-File -FilePath $randomFileName

Write-Output "Process list saved to $randomFileName"