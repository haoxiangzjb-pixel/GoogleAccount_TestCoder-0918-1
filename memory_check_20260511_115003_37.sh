#!/bin/bash

# 检查系统内存使用情况脚本

echo "=== 系统内存使用情况 ==="
echo ""

# 显示内存概要信息
echo "--- 内存概要 ---"
free -h
echo ""

# 显示详细内存信息
echo "--- 详细内存信息 ---"
cat /proc/meminfo | head -20
echo ""

# 计算内存使用百分比
echo "--- 内存使用率 ---"
used_mem=$(grep MemTotal /proc/meminfo | awk '{print $2}')
avail_mem=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

if [ -n "$avail_mem" ]; then
    used_percent=$(( (used_mem - avail_mem) * 100 / used_mem ))
    echo "内存使用率: ${used_percent}%"
else
    # 如果 MemAvailable 不可用（旧系统），使用 Buffers+Cached 估算
    buffers=$(grep "^Buffers:" /proc/meminfo | awk '{print $2}')
    cached=$(grep "^Cached:" /proc/meminfo | awk '{print $2}')
    free_mem=$(grep "^MemFree:" /proc/meminfo | awk '{print $2}')
    avail_mem=$((free_mem + buffers + cached))
    used_percent=$(( (used_mem - avail_mem) * 100 / used_mem ))
    echo "内存使用率: ${used_percent}%"
fi
echo ""

# 显示占用内存最多的前10个进程
echo "--- 占用内存最多的前10个进程 ---"
ps aux --sort=-%mem | head -11
echo ""

echo "=== 检查完成 ==="
