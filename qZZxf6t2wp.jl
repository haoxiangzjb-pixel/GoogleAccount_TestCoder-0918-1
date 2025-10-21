# 创建一个矩阵并进行转置操作

# 创建一个3x3的矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 进行转置操作
transposed_matrix = transpose(matrix)
# 或者可以使用 matrix' (撇号) 来进行转置

println("\n转置后的矩阵:")
display(transposed_matrix)

# 创建一个随机矩阵并转置
random_matrix = rand(3, 4)
println("\n随机矩阵:")
display(random_matrix)

random_transposed = transpose(random_matrix)
println("\n转置后的随机矩阵:")
display(random_transposed)