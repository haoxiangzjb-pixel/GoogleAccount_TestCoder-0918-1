# Julia script for basic array operations
# This script demonstrates sum and mean operations on arrays

# Function to calculate sum of an array
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of an array
function calculate_mean(arr)
    return sum(arr) / length(arr)
end

# Example usage
println("Basic Array Operations in Julia")

# Create sample arrays
sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
println("Sample array: ", sample_array)

# Calculate sum
array_sum = calculate_sum(sample_array)
println("Sum of array: ", array_sum)

# Calculate mean
array_mean = calculate_mean(sample_array)
println("Mean of array: ", array_mean)

# Additional examples with different arrays
println("\nAdditional examples:")
arrays = [
    [10, 20, 30],
    [1.5, 2.5, 3.5, 4.5],
    [-5, -2, 0, 2, 5]
]

for (i, arr) in enumerate(arrays)
    println("Array $(i): ", arr)
    println("  Sum: ", calculate_sum(arr))
    println("  Mean: ", calculate_mean(arr))
    println()
end