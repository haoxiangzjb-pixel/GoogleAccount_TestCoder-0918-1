# PowerShell脚本：获取当前用户信息
Write-Host "获取当前用户信息..."

# 获取当前用户名
$username = $env:USERNAME
Write-Host "用户名: $username"

# 获取当前用户域
$userdomain = $env:USERDOMAIN
Write-Host "用户域: $userdomain"

# 获取用户全名（如果可用）
$fullname = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$username'").FullName
if ($fullname) {
    Write-Host "全名: $fullname"
} else {
    Write-Host "全名: 无法获取"
}

# 获取用户SID
$userSID = (Get-WmiObject -Class Win32_UserAccount -Filter "Name='$username'").SID
if ($userSID) {
    Write-Host "SID: $userSID"
} else {
    Write-Host "SID: 无法获取"
}

# 获取当前用户的所有组
$groups = (Get-LocalGroupMember -Member $username -ErrorAction SilentlyContinue).Group
Write-Host "所属组:"
$groups | ForEach-Object { Write-Host "  - $_" }

# 显示用户主目录
Write-Host "用户主目录: $env:USERPROFILE"

# 显示当前进程的用户上下文
Write-Host "当前上下文用户: $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)"

Write-Host "用户信息获取完成。"