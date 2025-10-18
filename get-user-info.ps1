# PowerShell script to get current user information
$currentUser = $env:USERNAME
$userDomain = $env:USERDOMAIN
$userInfo = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$currentUser'")
$userFullName = $userInfo.FullName
$userSID = $userInfo.SID
$userDescription = $userInfo.Description

Write-Host "User Information:"
Write-Host "Username: $currentUser"
Write-Host "Domain: $userDomain"
Write-Host "Full Name: $userFullName"
Write-Host "SID: $userSID"
Write-Host "Description: $userDescription"

# Save to a file with random name
$randomName = [System.IO.Path]::GetRandomFileName()
$randomName = $randomName -replace "\..*", ""  # Remove file extension
$outputFile = "$randomName.ps1"
"Username: $currentUser" | Out-File -FilePath $outputFile
"Domain: $userDomain" | Out-File -FilePath $outputFile -Append
"Full Name: $userFullName" | Out-File -FilePath $outputFile -Append
"SID: $userSID" | Out-File -FilePath $outputFile -Append
"Description: $userDescription" | Out-File -FilePath $outputFile -Append

Write-Host "User information saved to: $outputFile"