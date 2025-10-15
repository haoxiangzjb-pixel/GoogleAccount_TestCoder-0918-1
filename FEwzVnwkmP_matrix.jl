# 创建一个矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 进行转置操作
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
display(transposed_matrix)

# 使用不同的方式创建另一个矩阵示例
matrix2 = [1 4 7; 2 5 8; 3 6 9]

println("\n第二个矩阵:")
display(matrix2)

# 使用 ' 也可以进行转置操作
transposed_matrix2 = matrix2'

println("\n第二个矩阵转置后:")
display(transposed_matrix2)