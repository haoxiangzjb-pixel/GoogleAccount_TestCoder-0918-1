# PowerShell script to get current user information
# 获取当前用户信息

Write-Host "Getting current user information..." -ForegroundColor Green

# Get the current user's name
$username = $env:USERNAME
Write-Host "Username: $username"

# Get the current user's domain (if applicable)
$domain = $env:USERDOMAIN
Write-Host "Domain: $domain"

# Get the current user's home directory
$homeDir = $env:USERPROFILE
Write-Host "Home Directory: $homeDir"

# Get the current user's SID (Security Identifier)
try {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $sid = $currentUser.User.Value
    Write-Host "SID: $sid"
} catch {
    Write-Host "Could not retrieve SID: $_" -ForegroundColor Yellow
}

Write-Host "User information retrieval complete." -ForegroundColor Green