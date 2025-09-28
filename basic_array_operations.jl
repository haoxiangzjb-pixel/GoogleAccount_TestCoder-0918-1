# Julia script for basic array operations

# Define an example array
arr = [1, 2, 3, 4, 5]

# Calculate the sum
sum_result = sum(arr)
println("Sum of the array: ", sum_result)

# Calculate the mean
mean_result = sum(arr) / length(arr)
println("Mean of the array: ", mean_result)

# Alternative way to calculate mean using the Statistics package
using Statistics
mean_alt = mean(arr)
println("Mean using Statistics.mean: ", mean_alt)
