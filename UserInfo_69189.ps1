# 当前用户信息 - 生成时间: Tue Oct 21 10:53:14 UTC 2025
$UserInfo = @{
    "UserName" = "root"
    "UserDomain" = "c-68f765e6-010ec5a6-64a5d9b2b011"
    "ComputerName" = "c-68f765e6-010ec5a6-64a5d9b2b011"
    "UserSID" = "N/A - Linux system"
    "UserProfile" = "/home/root"
    "LogonServer" = "c-68f765e6-010ec5a6-64a5d9b2b011"
}

# 显示用户信息
Write-Host "当前用户信息："
Write-Host "用户名: $UserInfo.UserName"
Write-Host "用户域: $UserInfo.UserDomain"
Write-Host "计算机名: $UserInfo.ComputerName"
Write-Host "用户SID: $UserInfo.UserSID"
Write-Host "用户配置文件路径: $UserInfo.UserProfile"
Write-Host "登录服务器: $UserInfo.LogonServer"
