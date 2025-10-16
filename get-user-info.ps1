# PowerShell script to get current user information and save to a randomly named .ps1 file

# Get current user information
$currentUserInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CsUserName, CsDomain
$user = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$currentUser = New-Object System.Security.Principal.WindowsPrincipal($user)

# Create a hashtable with user information
$userInfo = @{
    "UserName" = $env:USERNAME
    "UserDomain" = $env:USERDOMAIN
    "ComputerName" = $env:COMPUTERNAME
    "UserSID" = $user.User
    "IsAdministrator" = $currentUser.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
    "HomeDirectory" = $env:USERPROFILE
    "ExecutionPolicy" = Get-ExecutionPolicy
    "CurrentDate" = Get-Date
}

# Display user information to console
Write-Host "Current User Information:" -ForegroundColor Green
Write-Host "===========================" -ForegroundColor Green
$userInfo.GetEnumerator() | ForEach-Object {
    Write-Host "$($_.Key): $($_.Value)"
}

# Generate a random filename
$randomFileName = "UserInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (1000..9999 | Get-Random) + ".ps1"

# Convert user info to PowerShell hashtable string format
$userInfoString = "@{`n"
$userInfo.GetEnumerator() | ForEach-Object {
    $userInfoString += "    $($_.Key) = `"$($_.Value)`"`n"
}
$userInfoString += "}"

# Add content to be saved in the file
$fileContent = @"
# User Information Script
# Generated on: $(Get-Date)
# This file contains user information captured at runtime

`$userInfo = $userInfoString

# Display the information
Write-Host "User Information:" -ForegroundColor Cyan
`$userInfo.GetEnumerator() | ForEach-Object {
    Write-Host "`$(`$_.Key): `$(`$_.Value)"
}

# Return the user info
return `$userInfo
"@

# Save to randomly named file
$fileContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "User information has been saved to: $randomFileName" -ForegroundColor Yellow