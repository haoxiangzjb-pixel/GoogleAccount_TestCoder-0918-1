#!/bin/bash

# 生成一个随机的临时文件名
random_filename=$(mktemp --suffix=.sh)

# 将内存检查脚本内容写入临时文件
cat << 'EOF' > "$random_filename"
#!/bin/bash
# 脚本：check_memory.sh
# 功能：检查系统内存使用情况并显示

echo "检查系统内存使用情况..."
echo "---------------------------"
# 使用 free 命令获取内存信息，并使用 awk 格式化输出
free -h | awk 'NR==2{printf "总内存: %s\n已用内存: %s\n可用内存: %s\n", $2, $3, $4}'
echo "---------------------------"
echo "脚本执行完毕。"
EOF

# 使生成的脚本具有可执行权限
chmod +x "$random_filename"

echo "内存检查脚本已创建并保存到: $random_filename"