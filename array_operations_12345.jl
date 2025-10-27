# Julia script for basic array operations

# Function to calculate sum of an array
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of an array
function calculate_mean(arr)
    return sum(arr) / length(arr)
end

# Function to calculate both sum and mean
function array_stats(arr)
    s = calculate_sum(arr)
    m = calculate_mean(arr)
    return s, m
end

# Example usage
println("Basic Array Operations in Julia")

# Create a sample array
sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Sample array: ", sample_array)

# Calculate sum
array_sum = calculate_sum(sample_array)
println("Sum of array elements: ", array_sum)

# Calculate mean
array_mean = calculate_mean(sample_array)
println("Mean of array elements: ", array_mean)

# Calculate both using the combined function
sum_result, mean_result = array_stats(sample_array)
println("Using combined function - Sum: ", sum_result, ", Mean: ", mean_result)

# Test with another array
another_array = [10, 20, 30, 40, 50]
println("\nAnother array: ", another_array)
sum_result2, mean_result2 = array_stats(another_array)
println("Sum: ", sum_result2, ", Mean: ", mean_result2)

# Test with floating point numbers
float_array = [1.5, 2.7, 3.2, 4.8, 5.1]
println("\nFloat array: ", float_array)
sum_result3, mean_result3 = array_stats(float_array)
println("Sum: ", sum_result3, ", Mean: ", mean_result3)