import random
import os

# 模拟Scala样例类的功能
class Point:
    def __init__(self, x: float, y: float):
        self.x = x
        self.y = y
    
    def __str__(self):
        return f"Point({self.x}, {self.y})"
    
    def __repr__(self):
        return self.__str__()

# 创建一个坐标点实例
point = Point(3.5, 4.2)

# 生成随机文件名
random_file_name = f"point_{random.randint(1000, 9999)}.txt"
file_path = os.path.join("/workspace", random_file_name)

# 将坐标点信息写入文件
with open(file_path, 'w') as file:
    file.write(str(point))

print(f"坐标点已保存到文件: {file_path}")
print(f"文件内容: {str(point)}")