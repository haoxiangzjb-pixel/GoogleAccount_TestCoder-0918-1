# 获取当前用户信息的PowerShell脚本

# 获取当前用户名
$username = $env:USERNAME

# 获取当前用户所在的域或计算机名
$computerName = $env:COMPUTERNAME

# 获取当前用户的主目录
$userProfile = $env:USERPROFILE

# 获取当前用户的临时目录
$tempPath = $env:TEMP

# 获取当前用户的域名（如果在域环境中）
$userDomain = $env:USERDOMAIN

# 获取当前用户的DNS域名（如果在域环境中）
$userDnsDomain = $env:USERDNSDOMAIN

# 输出用户信息
Write-Host "========== 当前用户信息 =========="
Write-Host "用户名: $username"
Write-Host "计算机名: $computerName"
Write-Host "用户主目录: $userProfile"
Write-Host "临时目录: $tempPath"
Write-Host "用户域: $userDomain"
Write-Host "用户DNS域: $userDnsDomain"
Write-Host "================================="

# 使用.NET方法获取更详细的用户信息
try {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    Write-Host "详细用户信息:"
    Write-Host "  SID: $($currentUser.User.Value)"
    Write-Host "  认证类型: $($currentUser.AuthenticationType)"
    Write-Host "  是否已认证: $($currentUser.IsAuthenticated)"
    Write-Host "  用户名(完整): $($currentUser.Name)"
    
    # 获取用户所属的组
    $groups = $currentUser.Groups
    Write-Host "  所属组:"
    foreach ($group in $groups) {
        try {
            $groupName = $group.Translate([System.Security.Principal.NTAccount])
            Write-Host "    - $groupName"
        }
        catch {
            Write-Host "    - $($group.Value) (无法解析为名称)"
        }
    }
}
catch {
    Write-Host "无法获取详细用户信息: $_"
}