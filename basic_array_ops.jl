# basic_array_ops.jl
# This script demonstrates basic array operations in Julia.

# Define a sample array
arr = [1, 2, 3, 4, 5]

# Calculate the sum of the array
sum_result = sum(arr)
println("Sum of the array: ", sum_result)

# Calculate the mean of the array
mean_result = mean(arr)
println("Mean of the array: ", mean_result)

# Perform operations on a 2D array
matrix = [1 2; 3 4]
println("Original 2D array (Matrix):")
println(matrix)

# Sum all elements in the 2D array
sum_matrix = sum(matrix)
println("Sum of all elements in the matrix: ", sum_matrix)

# Calculate the mean of all elements in the 2D array
mean_matrix = mean(matrix)
println("Mean of all elements in the matrix: ", mean_matrix)
