# array_operations_1234.jl

# Define an example array
arr = [1, 2, 3, 4, 5]

# Calculate the sum
sum_result = sum(arr)
println("Sum of the array: $sum_result")

# Calculate the mean
mean_result = sum_result / length(arr)
# Alternatively, using the Statistics package: mean_result = mean(arr)
println("Mean of the array: $mean_result")
