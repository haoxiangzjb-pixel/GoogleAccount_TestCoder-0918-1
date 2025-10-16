# User Information Script
# Generated on: Thu Oct 16 06:43:57 UTC 2025

$userInfo = @{
    "UserName" = "root"
    "UserDomain" = "c-68f093fb-010ec5a6-04d518986236"
    "ComputerName" = "c-68f093fb-010ec5a6-04d518986236"
    "UserSID" = "N/A on Linux"
    "IsAdministrator" = True
    "HomeDirectory" = "/root"
    "ExecutionPolicy" = "N/A on Linux"
    "CurrentDate" = "Thu Oct 16 06:43:57 UTC 2025"
}

# Display the information
Write-Host "User Information:" -ForegroundColor Cyan
$userInfo.GetEnumerator() | ForEach-Object {
    Write-Host "$($_.Key): $($_.Value)"
}

# Return the user info
return $userInfo
