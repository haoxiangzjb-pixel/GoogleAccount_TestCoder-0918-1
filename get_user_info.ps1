# PowerShell script to get current user info and save to a random named .ps1 file

# Get the current user's information
$currentUserInfo = whoami /all

# Generate a random filename for the output .ps1 file
$randomFileName = [System.IO.Path]::GetRandomFileName() + ".ps1"

# Define the full path for the output file
$outputFilePath = Join-Path -Path $PSScriptRoot -ChildPath $randomFileName

# Save the user information to the randomly named file
$currentUserInfo | Out-File -FilePath $outputFilePath -Encoding UTF8

Write-Output "Current user information has been saved to: $outputFilePath"