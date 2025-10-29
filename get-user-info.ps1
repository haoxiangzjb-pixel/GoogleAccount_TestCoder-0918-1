# PowerShell script to get current user information and save to a randomly named file

# Get current user information
$userInfo = Get-WmiObject -Class Win32_ComputerSystem | Select-Object Username
$currentPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
$userName = $env:USERNAME
$userDomain = $env:USERDOMAIN
$fullName = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$userName' AND Domain='$userDomain").FullName

# Create a hashtable with user information
$userData = @{
    Username = $userName
    Domain = $userDomain
    FullName = $fullName
    ComputerName = $env:COMPUTERNAME
    UserSID = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$userName' AND Domain='$userDomain").SID
}

# Generate a random filename with .ps1 extension
$randomName = "UserInfo_" + (Get-Random -Maximum 99999) + ".ps1"

# Save user information to the randomly named file as PowerShell script
$psContent = @"
# User Information Data
`$UserInfo = @{
    Username = '$($userData.Username)'
    Domain = '$($userData.Domain)'
    FullName = '$($userData.FullName)'
    ComputerName = '$($userData.ComputerName)'
    UserSID = '$($userData.UserSID)'
}
"@
$psContent | Out-File -FilePath $randomName -Encoding UTF8

Write-Host "User information saved to: $randomName"
Write-Host "Username: $($userData.Username)"
Write-Host "Domain: $($userData.Domain)"
Write-Host "Full Name: $($userData.FullName)"
Write-Host "Computer Name: $($userData.ComputerName)"