# Get current user information
$userInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CsUserName, CsNumberOfLogicalProcessors

# Generate a random filename
$randomFileName = "UserInfo_" + (New-Guid).ToString() + ".txt"

# Export user information to the random file
$userInfo | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "User information has been saved to $randomFileName"