# PowerShell script to get a list of processes and save to a file with a random name

# Generate a random file name
$randomFileName = [System.IO.Path]::GetRandomFileName() + ".txt"
$outputPath = Join-Path -Path $PWD -ChildPath $randomFileName

# Get the list of processes and export to the randomly named file
Get-Process | Out-File -FilePath $outputPath

Write-Output "Process list saved to: $outputPath"