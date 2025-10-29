# 创建一个矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 进行转置操作
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
display(transposed_matrix)

# 也可以使用 ' 做转置操作
transposed_matrix2 = matrix'

println("\n使用 ' 操作符转置后的矩阵:")
display(transposed_matrix2)