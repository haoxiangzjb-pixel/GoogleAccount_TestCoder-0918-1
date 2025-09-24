#!/bin/bash

# 获取当前用户名
USERNAME=$(whoami)

# 获取用户的家目录
HOME_DIR=$(eval echo ~$USERNAME)

# 获取当前工作目录
CURRENT_DIR=$(pwd)

# 获取当前Shell
USER_SHELL=$(getent passwd $USERNAME | cut -d: -f7)

# 获取用户ID
USER_ID=$(id -u $USERNAME)

# 获取组ID
GROUP_ID=$(id -g $USERNAME)

# 获取用户所属的所有组
GROUPS=$(id -Gn $USERNAME)

# 生成一个随机的文件名
RANDOM_FILENAME="/workspace/user_info_$(date +%s%N).sh"

# 将用户信息收集到一个变量中
USER_INFO="当前用户信息:
用户名: $USERNAME
用户ID: $USER_ID
组ID: $GROUP_ID
所属组: $GROUPS
家目录: $HOME_DIR
当前目录: $CURRENT_DIR
Shell: $USER_SHELL
"

# 将用户信息写入文件
echo "$USER_INFO" > "$RANDOM_FILENAME"

echo "用户信息已保存到随机命名的文件中: $RANDOM_FILENAME"