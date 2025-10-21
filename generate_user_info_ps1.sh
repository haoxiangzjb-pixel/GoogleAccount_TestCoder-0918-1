#!/bin/bash

# 生成包含当前用户信息的随机命名.ps1文件的Bash脚本

# 获取当前用户信息（模拟PowerShell环境变量）
USERNAME=$(whoami)
USERDOMAIN=$(hostname)
COMPUTERNAME=$(hostname)
USERPROFILE="/home/$USERNAME"
LOGONSERVER=$(hostname)

# 生成随机文件名
RANDOM_FILENAME="UserInfo_$(shuf -i 10000-99999 -n 1).ps1"

# 创建PowerShell脚本内容
cat > "$RANDOM_FILENAME" << EOF
# 当前用户信息 - 生成时间: $(date)
\$UserInfo = @{
    "UserName" = "$USERNAME"
    "UserDomain" = "$USERDOMAIN"
    "ComputerName" = "$COMPUTERNAME"
    "UserSID" = "N/A - Linux system"
    "UserProfile" = "$USERPROFILE"
    "LogonServer" = "$LOGONSERVER"
}

# 显示用户信息
Write-Host "当前用户信息："
Write-Host "用户名: \$UserInfo.UserName"
Write-Host "用户域: \$UserInfo.UserDomain"
Write-Host "计算机名: \$UserInfo.ComputerName"
Write-Host "用户SID: \$UserInfo.UserSID"
Write-Host "用户配置文件路径: \$UserInfo.UserProfile"
Write-Host "登录服务器: \$UserInfo.LogonServer"
EOF

echo "用户信息已保存到文件: $RANDOM_FILENAME"
ls -la "$RANDOM_FILENAME"