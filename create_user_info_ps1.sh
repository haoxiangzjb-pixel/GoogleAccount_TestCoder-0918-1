#!/bin/bash

# 生成一个随机的 .ps1 文件名
random_filename=$(mktemp --suffix=.ps1)

# 获取当前 Linux 用户信息
current_user=$(whoami)
current_uid=$(id -u)
current_gid=$(id -g)
current_home=$(eval echo ~$current_user)
current_shell=$SHELL

# 模拟 PowerShell 的 $env:USERNAME 和 $env:USERPROFILE 等信息
# 并将这些信息写入随机命名的 .ps1 文件
cat <<EOF > "$random_filename"
# This is a simulated PowerShell script created on Linux.
# It contains user information from the Linux environment.
# This file is NOT a functional PowerShell script.

# Username (simulated from Linux whoami)
\$env:USERNAME = "$current_user"

# User ID (simulated from Linux id -u)
\$env:USERID = "$current_uid"

# Group ID (simulated from Linux id -g)
\$env:GROUPID = "$current_gid"

# Home Directory (simulated from Linux ~)
\$env:USERPROFILE = "$current_home"

# Default Shell (simulated from Linux \$SHELL)
\$env:SHELL = "$current_shell"

Write-Host "Simulated PowerShell script generated on Linux."
Write-Host "Username: \$env:USERNAME"
Write-Host "User ID:  \$env:USERID"
Write-Host "Group ID: \$env:GROUPID"
Write-Host "Home Dir: \$env:USERPROFILE"
Write-Host "Shell:    \$env:SHELL"
EOF

echo "Created simulated PowerShell script: $random_filename"