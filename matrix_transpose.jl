# 创建一个 3x3 的随机整数矩阵
A = rand(1:10, 3, 3)

# 打印原始矩阵
println("原始矩阵 A:")
display(A)
println() # 空行

# 计算矩阵 A 的转置
A_transpose = A'

# 打印转置矩阵
println("转置矩阵 A':")
display(A_transpose)
