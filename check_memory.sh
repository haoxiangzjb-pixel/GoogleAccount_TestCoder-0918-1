#!/bin/bash

# 生成一个随机文件名
random_filename=$(mktemp -t memory_usage_XXXXXX.log)

# 获取内存使用情况并保存到随机命名的文件中
free -h > "$random_filename"

echo "Memory usage saved to $random_filename"
cat "$random_filename"
