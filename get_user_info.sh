#!/bin/bash
# 获取当前用户名
USERNAME=$(whoami)
# 获取当前用户ID
USERID=$(id -u)
# 获取当前用户的家目录
HOME_DIR=$(echo ~)

# 打印信息到终端（可选）
echo "Username: $USERNAME"
echo "User ID: $USERID"
echo "Home Directory: $HOME_DIR"

# 创建一个包含当前时间戳的随机文件名
TIMESTAMP=$(date +%Y%m%d_%H%M%S_%N)
OUTPUT_FILE="/workspace/user_info_${TIMESTAMP}.sh"

# 将信息写入随机命名的文件
cat <<EOF > "$OUTPUT_FILE"
Username: $USERNAME
User ID: $USERID
Home Directory: $HOME_DIR
EOF

echo "User information saved to $OUTPUT_FILE"