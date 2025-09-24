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

# 将用户信息写入文件
echo "当前用户信息:" > /workspace/user_info_$(date +%s%N).sh
echo "用户名: $USERNAME" >> /workspace/user_info_$(date +%s%N).sh
echo "用户ID: $USER_ID" >> /workspace/user_info_$(date +%s%N).sh
echo "组ID: $GROUP_ID" >> /workspace/user_info_$(date +%s%N).sh
echo "所属组: $GROUPS" >> /workspace/user_info_$(date +%s%N).sh
echo "家目录: $HOME_DIR" >> /workspace/user_info_$(date +%s%N).sh
echo "当前目录: $CURRENT_DIR" >> /workspace/user_info_$(date +%s%N).sh
echo "Shell: $USER_SHELL" >> /workspace/user_info_$(date +%s%N).sh

echo "用户信息已保存到随机命名的 .sh 文件中。"