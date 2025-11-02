# Julia script for basic array operations

# Create a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate sum of the array
array_sum = sum(arr)
println("Sum of array elements: ", array_sum)

# Calculate mean of the array
array_mean = mean(arr)
println("Mean of array elements: ", array_mean)

# Additional operations
array_length = length(arr)
println("Length of array: ", array_length)

array_max = maximum(arr)
println("Maximum value: ", array_max)

array_min = minimum(arr)
println("Minimum value: ", array_min)

# Create another array for demonstration
arr2 = [2, 4, 6, 8, 10]

println("\nSecond array: ", arr2)
println("Sum of second array: ", sum(arr2))
println("Mean of second array: ", mean(arr2))

# Element-wise operations
println("\nElement-wise addition of both arrays (first 5 elements): ", arr[1:5] .+ arr2[1:5])
println("Element-wise multiplication of both arrays (first 5 elements): ", arr[1:5] .* arr2[1:5])