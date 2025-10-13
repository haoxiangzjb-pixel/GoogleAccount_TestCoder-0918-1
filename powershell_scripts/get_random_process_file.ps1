# PowerShell script to get process list and save to a file with a random name

# Generate a random filename
$randomFileName = "ProcessList_" + (Get-Random -Maximum 99999) + ".csv"

# Get the process list and export it to the randomly named file
Get-Process | Export-Csv -Path $randomFileName -NoTypeInformation

Write-Output "Process list exported to $randomFileName"