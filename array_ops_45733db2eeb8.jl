# Julia script for basic array operations

using Statistics

# Create a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate the sum of the array
array_sum = sum(arr)
println("Sum of array elements: ", array_sum)

# Calculate the mean of the array
array_mean = mean(arr)
println("Mean of array elements: ", array_mean)

# Additional array operations
array_length = length(arr)
println("Length of array: ", array_length)

array_maximum = maximum(arr)
println("Maximum value in array: ", array_maximum)

array_minimum = minimum(arr)
println("Minimum value in array: ", array_minimum)

# Calculate sum and mean for a different array
arr2 = [2.5, 3.7, 1.2, 8.9, 5.1]
println("\nSecond array: ", arr2)
println("Sum of second array: ", sum(arr2))
println("Mean of second array: ", mean(arr2))

# Function to calculate sum and mean
function calculate_sum_mean(input_array)
    s = sum(input_array)
    m = mean(input_array)
    return s, m
end

# Using the function
sum_result, mean_result = calculate_sum_mean(arr)
println("\nUsing function - Sum: ", sum_result, ", Mean: ", mean_result)