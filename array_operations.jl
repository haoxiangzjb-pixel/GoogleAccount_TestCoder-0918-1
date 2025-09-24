# array_operations.jl
# This script performs basic array operations like sum and mean.

# Define an example array
numbers = [10, 20, 30, 40, 50]

# Calculate the sum
array_sum = sum(numbers)
println("The sum of the array elements is: ", array_sum)

# Calculate the mean
array_mean = mean(numbers)
println("The mean of the array elements is: ", array_mean)

# Demonstrate with a different array
other_numbers = [1.5, 2.5, 3.5, 4.5]
println("\nFor the array ", other_numbers)
println("Sum: ", sum(other_numbers))
println("Mean: ", mean(other_numbers))
