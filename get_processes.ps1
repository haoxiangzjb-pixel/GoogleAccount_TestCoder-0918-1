# PowerShell script to get a list of processes and save to a file with a random name

# Get the list of processes
$processes = Get-Process

# Generate a random filename with .csv extension
$randomFileName = [System.IO.Path]::GetRandomFileName() + '.csv'

# Export the processes to the CSV file
$processes | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Process list saved to $randomFileName"