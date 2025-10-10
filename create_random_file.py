import random
import string

# 定义样例类的字符串表示
point_data = "Point(1.0,2.5)"

# 生成随机文件名
random_filename = "random_file_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".txt"

# 将数据写入随机命名的文件
with open(random_filename, 'w') as f:
    f.write(point_data)

print(f"样例类数据已写入文件: {random_filename}")