#!/bin/bash

# 脚本：check_memory.sh
# 功能：检查系统内存使用情况并显示

echo "内存使用情况报告 (由 free -h 生成):"
free -h

echo -e "\n内存使用情况报告 (由 /proc/meminfo 生成):"
awk '/^MemTotal:/ {total=$2} /^MemAvailable:/ {available=$2} END {used=total-available; printf "总内存: %.2f GB\n已用内存: %.2f GB\n可用内存: %.2f GB\n", total/1024/1024, used/1024/1024, available/1024/1024}' /proc/meminfo
