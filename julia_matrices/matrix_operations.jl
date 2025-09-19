# Julia脚本：创建矩阵并进行转置操作

# 创建一个3x4的随机矩阵
original_matrix = rand(3, 4)

# 对矩阵进行转置
transposed_matrix = transpose(original_matrix)
# 或者使用简写的转置操作符
# transposed_matrix = original_matrix'

# 打印结果
println("原始矩阵 (3x4):")
println(original_matrix)

println("\n转置后的矩阵 (4x3):")
println(transposed_matrix)

# 验证转置的维度
println("\n原始矩阵的维度: ", size(original_matrix))
println("转置矩阵的维度: ", size(transposed_matrix))