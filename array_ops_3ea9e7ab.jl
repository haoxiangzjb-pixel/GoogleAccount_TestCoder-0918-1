# Julia script for basic array operations

# Function to calculate sum of an array
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of an array
function calculate_mean(arr)
    return mean(arr)
end

# Function to calculate other basic statistics
function calculate_stats(arr)
    println("Array: ", arr)
    println("Sum: ", calculate_sum(arr))
    println("Mean: ", calculate_mean(arr))
    println("Length: ", length(arr))
    println("Minimum: ", minimum(arr))
    println("Maximum: ", maximum(arr))
    println()
end

# Import Statistics package for mean function
using Statistics

# Example arrays for demonstration
array1 = [1, 2, 3, 4, 5]
array2 = [10, 20, 30, 40, 50]
array3 = [2.5, 3.7, 1.2, 8.9, 5.1]

println("Basic Array Operations in Julia")
println("===============================")

# Calculate stats for each array
calculate_stats(array1)
calculate_stats(array2)
calculate_stats(array3)

# Additional operations
println("Additional Operations:")
println("Element-wise addition [1,2,3] + [4,5,6]: ", [1,2,3] .+ [4,5,6])
println("Element-wise multiplication [1,2,3] * [4,5,6]: ", [1,2,3] .* [4,5,6])