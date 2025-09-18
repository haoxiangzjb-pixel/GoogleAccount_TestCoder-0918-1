import random
import string
import shutil

# Generate a random filename with .ps1 extension
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.ps1'
print(f"生成的随机文件名: {filename}")

# Copy the PowerShell script content to the new file
source_file = 'get_user_info.ps1'
try:
    shutil.copy(source_file, filename)
    print(f"已将PowerShell脚本保存到: {filename}")
except Exception as e:
    print(f"复制文件时出错: {e}")