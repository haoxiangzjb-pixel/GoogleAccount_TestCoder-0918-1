# 创建一个 3x3 的矩阵 A
A = [1 2 3; 4 5 6; 7 8 9]

# 打印原始矩阵
println("原始矩阵 A:")
display(A)

# 计算矩阵 A 的转置
A_transpose = A'

# 打印转置矩阵
println("\n转置矩阵 A':")
display(A_transpose)

# 可以选择将结果保存到文件或进行其他操作
# 例如，将转置矩阵写入新文件
writedlm("A_transpose_output.txt", A_transpose, ' ')
println("\n转置矩阵已保存到 A_transpose_output.txt")