#!/bin/bash

# 脚本：检查系统内存使用情况
# 作者：AI助手
# 日期：$(date)

echo "系统内存使用情况报告"
echo "====================="
echo "生成时间: $(date)"
echo ""

# 显示内存使用情况
echo "内存使用详情："
free -h

echo ""
echo "内存使用百分比："
# 获取内存使用百分比
mem_usage=$(free | grep Mem | awk '{printf "%.2f", $3/$2 * 100.0}')
echo "内存使用率: ${mem_usage}%"

echo ""
echo "详细内存信息："
cat /proc/meminfo | head -10

echo ""
echo "交换分区使用情况："
swapon --show

echo ""
echo "内存使用最高的前5个进程："
ps aux --sort=-%mem | head -6

echo ""
echo "脚本执行完成。"