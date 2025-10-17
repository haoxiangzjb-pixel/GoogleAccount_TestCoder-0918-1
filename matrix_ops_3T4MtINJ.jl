# 创建一个3x3的矩阵
A = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵 A:")
display(A)

# 对矩阵进行转置操作
A_transpose = transpose(A)

println("\n转置后的矩阵 A^T:")
display(A_transpose)

# 也可以使用 A' 来进行转置
A_transpose_alt = A'

println("\n使用 A' 进行转置的结果:")
display(A_transpose_alt)

# 创建一个不同大小的随机矩阵进行演示
B = rand(1:10, 4, 3)  # 创建一个4x3的随机整数矩阵

println("\n随机矩阵 B:")
display(B)

println("\n转置后的矩阵 B^T (3x4):")
display(transpose(B))