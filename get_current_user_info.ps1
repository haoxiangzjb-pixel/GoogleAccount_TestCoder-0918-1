# 获取当前用户信息的PowerShell脚本

# 获取当前用户的基本信息
$currentUserInfo = @{
    "UserName" = $env:USERNAME
    "UserDomain" = $env:USERDOMAIN
    "ComputerName" = $env:COMPUTERNAME
    "UserSID" = (Get-WmiObject Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME}).SID
    "UserProfile" = $env:USERPROFILE
    "LogonServer" = $env:LOGONSERVER
}

# 显示用户信息
Write-Host "当前用户信息："
Write-Host "用户名: $($currentUserInfo.UserName)"
Write-Host "用户域: $($currentUserInfo.UserDomain)"
Write-Host "计算机名: $($currentUserInfo.ComputerName)"
Write-Host "用户SID: $($currentUserInfo.UserSID)"
Write-Host "用户配置文件路径: $($currentUserInfo.UserProfile)"
Write-Host "登录服务器: $($currentUserInfo.LogonServer)"

# 将信息保存到随机命名的.ps1文件中
$randomFileName = "UserInfo_" + (Get-Random -Maximum 99999) + ".ps1"
$scriptContent = @"
# 当前用户信息 - 生成时间: $(Get-Date)
`$UserInfo = @{
    "UserName" = "$($currentUserInfo.UserName)"
    "UserDomain" = "$($currentUserInfo.UserDomain)"
    "ComputerName" = "$($currentUserInfo.ComputerName)"
    "UserSID" = "$($currentUserInfo.UserSID)"
    "UserProfile" = "$($currentUserInfo.UserProfile)"
    "LogonServer" = "$($currentUserInfo.LogonServer)"
}

# 显示用户信息
Write-Host "当前用户信息："
Write-Host "用户名: `$UserInfo.UserName"
Write-Host "用户域: `$UserInfo.UserDomain"
Write-Host "计算机名: `$UserInfo.ComputerName"
Write-Host "用户SID: `$UserInfo.UserSID"
Write-Host "用户配置文件路径: `$UserInfo.UserProfile"
Write-Host "登录服务器: `$UserInfo.LogonServer"
"@

# 保存到随机命名的文件
$scriptContent | Out-File -FilePath $randomFileName -Encoding UTF8

Write-Host "用户信息已保存到文件: $randomFileName"