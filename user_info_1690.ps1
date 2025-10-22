# PowerShell脚本：获取当前用户信息
# 获取当前用户信息
$currentUserInfo = Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CsUserName, CsDomain
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)

# 输出用户信息
Write-Host "当前用户信息：" -ForegroundColor Green
Write-Host "用户名: $($currentUserInfo.CsUserName)"
Write-Host "用户域: $($currentUserInfo.CsDomain)"
Write-Host "Windows版本: $($currentUserInfo.WindowsVersion)"
Write-Host "Windows产品名: $($currentUserInfo.WindowsProductName)"
Write-Host "是否为管理员: $($userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))"

# 也可以使用其他方法获取用户信息
Write-Host "`n其他用户信息方法：" -ForegroundColor Green
$envUserInfo = @{
    UserName = $env:USERNAME
    UserDomain = $env:USERDOMAIN
    ComputerName = $env:COMPUTERNAME
    UserProfile = $env:USERPROFILE
    LogonServer = $env:LOGONSERVER
}

$envUserInfo | Format-List
