# Basic Array Operations in Julia
using Statistics

# Create a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Calculate sum of array elements
arr_sum = sum(arr)

# Calculate mean of array elements
arr_mean = mean(arr)

# Display results
println("Array: ", arr)
println("Sum: ", arr_sum)
println("Mean: ", arr_mean)

# Additional operations
arr_squared = arr .^ 2
println("Squared Array: ", arr_squared)
println("Sum of Squares: ", sum(arr_squared))
println("Mean of Squares: ", mean(arr_squared))