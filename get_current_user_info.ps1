# PowerShell脚本：获取当前用户信息
# 此脚本适用于Windows PowerShell环境

# 获取当前用户上下文
$currentPrincipal = [System.Security.Principal.WindowsIdentity]::GetCurrent()

# 输出用户主体名称 (User Principal Name)
Write-Output "User Principal Name: $($currentPrincipal.Name)"

# 输出用户标识（如果可用）
Write-Output "User Identity: $($currentPrincipal.User)"

# 输出用户是否为管理员
$isAdmin = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
Write-Output "Is Admin: $isAdmin"

# 使用whoami命令获取用户名
Write-Output "Username (via whoami): $(whoami)"