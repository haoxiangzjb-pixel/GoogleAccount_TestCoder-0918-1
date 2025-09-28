# PowerShell script to get processes and save to a file with a random name

# Generate a random filename
$randomFileName = "processes_$(Get-Random).csv"

# Get the list of processes and export to the randomly named CSV file
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Host "Process list saved to $randomFileName"