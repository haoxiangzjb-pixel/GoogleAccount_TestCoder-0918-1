# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$currentUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:USERNAME'").SID
    FullName = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:USERNAME'").FullName
    HomeDirectory = $env:USERPROFILE
    LogonServer = $env:LOGONSERVER
}

# Convert user info to a string representation
$userInfoString = @"
# Current User Information
UserName: $($currentUserInfo.UserName)
UserDomain: $($currentUserInfo.UserDomain)
ComputerName: $($currentUserInfo.ComputerName)
UserSID: $($currentUserInfo.UserSID)
FullName: $($currentUserInfo.FullName)
HomeDirectory: $($currentUserInfo.HomeDirectory)
LogonServer: $($currentUserInfo.LogonServer)
"@

# Generate a random filename with .ps1 extension
$randomFileName = "user_info_" + (Get-Random -Maximum 10000) + ".ps1"

# Save the user information to the randomly named file
$userInfoString | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "Current user information saved to: $randomFileName"
Write-Host $userInfoString