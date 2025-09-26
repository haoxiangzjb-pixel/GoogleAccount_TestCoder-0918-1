# array_operations.jl
# A simple Julia script for basic array operations

# Define an example array
arr = [1, 2, 3, 4, 5]

# Calculate the sum of the array
sum_result = sum(arr)
println("Sum of the array: ", sum_result)

# Calculate the mean of the array
mean_result = mean(arr)
println("Mean of the array: ", mean_result)

# Example with a different array
arr2 = [10.0, 20.0, 30.0]
println("\nFor array: ", arr2)
println("Sum: ", sum(arr2))
println("Mean: ", mean(arr2))