#!/bin/bash

# 获取当前用户信息的脚本
echo "当前用户信息："
echo "用户名: $(whoami)"
echo "用户ID: $(id -u)"
echo "组ID: $(id -g)"
echo "主目录: $HOME"
echo "当前工作目录: $(pwd)"
echo "登录Shell: $SHELL"
echo "主机名: $(hostname)"
echo "系统信息: $(uname -a)"
echo "登录信息:"
who