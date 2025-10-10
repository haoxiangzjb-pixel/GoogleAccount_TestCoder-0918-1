# PowerShell script to get current user information
$currentUser = $env:USERNAME
$computerName = $env:COMPUTERNAME
$userDomain = $env:USERDOMAIN

Write-Output "Current User: $currentUser"
Write-Output "Computer Name: $computerName"
Write-Output "User Domain: $userDomain"

# Get more detailed user information using WMI
$userDetails = Get-WmiObject -Class Win32_UserAccount -Filter "Name='$currentUser'" -ComputerName $computerName
Write-Output "Full Name: $($userDetails.FullName)"
Write-Output "Caption: $($userDetails.Caption)"
Write-Output "SID: $($userDetails.SID)"