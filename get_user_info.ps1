# 获取当前用户信息并以JSON格式输出
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$userInfo = @{
    Name = $currentUser.Name
    UserPrincipalName = $currentUser.UserPrincipalName
}
$userInfo | ConvertTo-Json