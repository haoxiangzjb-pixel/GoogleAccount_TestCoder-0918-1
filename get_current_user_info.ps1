# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$currentUserInfo = @{
    "UserName" = $env:USERNAME
    "UserDomain" = $env:USERDOMAIN
    "ComputerName" = $env:COMPUTERNAME
    "UserProfile" = $env:USERPROFILE
    "FullName" = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:USERNAME'").FullName
}

# Convert user info to a string representation
$userInfoString = @"
Current User Information:
-------------------------
Username: $($currentUserInfo.UserName)
Domain: $($currentUserInfo.UserDomain)
Computer Name: $($currentUserInfo.ComputerName)
User Profile Path: $($currentUserInfo.UserProfile)
Full Name: $($currentUserInfo.FullName)
"@

# Generate a random filename with .ps1 extension
$randomFileName = "user_info_" + (Get-Random -Maximum 100000) + ".ps1"

# Save the user information to the randomly named file
$userInfoString | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Current user information has been saved to: $randomFileName"
Write-Host $userInfoString