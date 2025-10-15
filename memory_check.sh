#!/bin/bash

# 脚本：检查系统内存使用情况
# 作者：AI Assistant
# 日期：$(date)

echo "系统内存使用情况报告"
echo "====================="
echo "生成时间: $(date)"
echo ""

# 使用free命令获取内存信息
echo "内存使用详情："
free -h

echo ""
echo "内存使用率（以百分比显示）："
# 获取内存使用百分比
mem_usage=$(free | grep '^Mem:' | awk '{printf "%.2f", $3/$2 * 100.0}')
echo "内存使用率: ${mem_usage}%"

echo ""
echo "详细内存信息（/proc/meminfo）："
echo "总内存：$(grep 'MemTotal' /proc/meminfo | awk '{print $2/1024/1024 " GB"}')"
echo "可用内存：$(grep 'MemAvailable' /proc/meminfo | awk '{print $2/1024/1024 " GB"}')"

echo ""
echo "内存使用最高的前5个进程："
ps aux --sort=-%mem | head -6 | awk 'NR>1 {printf "%-20s %s\n", $11, $4"%"}'

echo ""
echo "脚本执行完成。"