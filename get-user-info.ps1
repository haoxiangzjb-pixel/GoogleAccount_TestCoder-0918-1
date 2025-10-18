# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$currentUserInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CurrentTimeZone, BootUpTime
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userDetails = @{
    Name = $currentUser.Name
    UserPrincipalName = $currentUser.UserPrincipalName
    AuthenticationType = $currentUser.AuthenticationType
    IsAuthenticated = $currentUser.IsAuthenticated
    Token = $currentUser.Token
}

# Convert user details to a formatted string
$userInfoString = @"
Current User Information:
------------------------
Username: $($currentUser.Name)
User Principal Name: $($userDetails.UserPrincipalName)
Authentication Type: $($userDetails.AuthenticationType)
Is Authenticated: $($userDetails.IsAuthenticated)
Windows Product Name: $($currentUserInfo.WindowsProductName)
Windows Version: $($currentUserInfo.WindowsVersion)
Current Time Zone: $($currentUserInfo.CurrentTimeZone)
Boot Up Time: $($currentUserInfo.BootUpTime)
"@

# Generate a random filename
$randomFileName = "UserInfo_" + (Get-Random -Maximum 99999) + ".ps1"

# Save the user information to the randomly named file
$userInfoString | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Output "Current user information has been saved to: $randomFileName"
Write-Output $userInfoString