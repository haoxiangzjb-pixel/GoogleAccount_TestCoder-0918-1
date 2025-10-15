# Julia script for basic array operations
# This script demonstrates sum and mean calculations on arrays

# Define a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate the sum of the array
sum_result = sum(arr)
println("Sum of array: ", sum_result)

# Calculate the mean of the array
mean_result = mean(arr)
println("Mean of array: ", mean_result)

# Additional examples with different arrays
arr2 = [2.5, 4.7, 6.1, 8.9, 10.3]
println("\nSecond array: ", arr2)
println("Sum of second array: ", sum(arr2))
println("Mean of second array: ", mean(arr2))

# Using a randomly generated array
using Random
random_arr = rand(1:100, 10)  # Generate 10 random integers between 1 and 100
println("\nRandom array: ", random_arr)
println("Sum of random array: ", sum(random_arr))
println("Mean of random array: ", mean(random_arr))