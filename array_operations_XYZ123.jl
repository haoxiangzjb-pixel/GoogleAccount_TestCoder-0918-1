#!/usr/bin/env julia

# Basic Array Operations in Julia

println("Basic Array Operations in Julia")

# Create a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
println("Original array: ", arr)

# Calculate the sum of the array
array_sum = sum(arr)
println("Sum of array: ", array_sum)

# Calculate the mean of the array
array_mean = mean(arr)
println("Mean of array: ", array_mean)

# Additional array operations
array_length = length(arr)
println("Length of array: ", array_length)

array_max = maximum(arr)
println("Maximum value: ", array_max)

array_min = minimum(arr)
println("Minimum value: ", array_min)

# Create another array for demonstration
arr2 = [2, 4, 6, 8, 10]
println("\nSecond array: ", arr2)

# Element-wise operations
println("Sum of both arrays element-wise: ", arr2 .+ arr[1:length(arr2)])

# Calculate sum and mean for the second array
println("Sum of second array: ", sum(arr2))
println("Mean of second array: ", mean(arr2))

println("\nAll operations completed successfully!")