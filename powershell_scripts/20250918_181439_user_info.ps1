# PowerShell Script to Get Current User Information
# File Name: 20250918_181439_user_info.ps1

# Get the current user information
$currentUser = whoami

# Get additional user details using 'id' command
$userDetails = id

# Output the information
Write-Host "Current User: $currentUser"
Write-Host "User Details: $userDetails"

# Get environment variables related to the user
Write-Host "Username (from environment): $env:USER"
Write-Host "Home Directory: $env:HOME"