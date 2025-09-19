# 获取当前用户信息的PowerShell脚本

# 获取当前用户的基本信息
$currentUser = whoami
Write-Host "当前用户: $currentUser" -ForegroundColor Green

# 获取详细的用户信息
$userInfo = Get-CimInstance -ClassName Win32_UserAccount | Where-Object {$_.Name -eq $env:USERNAME}
Write-Host "用户名: $($userInfo.Name)" -ForegroundColor Green
Write-Host "全名: $($userInfo.FullName)" -ForegroundColor Green
Write-Host "账户类型: $($userInfo.Description)" -ForegroundColor Green
Write-Host "SID: $($userInfo.SID)" -ForegroundColor Green

# 获取用户所属的组
$groups = Get-CimInstance -ClassName Win32_GroupInDomain | Where-Object {$_.PartComponent -like "*$($userInfo.Name)*"}
Write-Host "用户所属组:" -ForegroundColor Green
$groups | ForEach-Object {
    Write-Host "  $($_.PartComponent)" -ForegroundColor Yellow
}

# 获取环境变量信息
Write-Host "用户环境变量:" -ForegroundColor Green
Write-Host "  USERNAME: $env:USERNAME" -ForegroundColor Yellow
Write-Host "  USERDOMAIN: $env:USERDOMAIN" -ForegroundColor Yellow
Write-Host "  USERDNSDOMAIN: $env:USERDNSDOMAIN" -ForegroundColor Yellow
Write-Host "  HOME: $env:HOME" -ForegroundColor Yellow
Write-Host "  HOMEDRIVE: $env:HOMEDRIVE" -ForegroundColor Yellow
Write-Host "  HOMEPATH: $env:HOMEPATH" -ForegroundColor Yellow

# 获取当前进程的用户令牌信息
$process = Get-Process -Id $PID
$processUser = (Get-CimInstance -ClassName Win32_Process -Filter "ProcessId=$($process.Id)" | 
    Invoke-CimMethod -MethodName GetOwner).User
Write-Host "进程用户: $processUser" -ForegroundColor Green