# PowerShell script to get current user info and save it

# Get current user information
$currentUser = $env:USERNAME
$currentDomain = $env:USERDOMAIN
$currentTime = Get-Date

# Prepare the information string
$info = "Current User: $currentUser`nDomain/Computer: $currentDomain`nCurrent Time: $currentTime`n"

# Output to console
Write-Output $info

# Define a random filename
$randomFileName = "UserInfo_" + (Get-Random -Maximum 10000) + ".log"

# Save to the randomly named file
$info | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Output "Information also saved to: $randomFileName"