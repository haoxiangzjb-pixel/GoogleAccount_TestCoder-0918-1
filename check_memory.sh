#!/bin/bash

# 生成一个随机文件名
random_filename=$(mktemp --suffix=.log)

# 获取内存使用情况并保存到随机命名的文件中
free -h > "$random_filename"

echo "内存使用情况已保存到: $random_filename"
cat "$random_filename"

