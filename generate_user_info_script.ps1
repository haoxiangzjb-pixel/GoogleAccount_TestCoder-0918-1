# This script generates another PowerShell script to get user info and save it to a random file.

# Define the content of the target script
$targetScriptContent = @'
# Get current user information
$userInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CsUserName, CsNumberOfLogicalProcessors

# Generate a random filename
$randomFileName = "UserInfo_" + (New-Guid).ToString() + ".txt"

# Export user information to the random file
$userInfo | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "User information has been saved to $randomFileName"
'@

# Write the target script content to a file
$targetScriptPath = "get_user_info_and_save.ps1"
Set-Content -Path $targetScriptPath -Value $targetScriptContent -Encoding UTF8

Write-Host "Generated script 'get_user_info_and_save.ps1'. This script must be run on a Windows machine with PowerShell."