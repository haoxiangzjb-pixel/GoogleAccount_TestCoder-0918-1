# Julia script for basic array operations
# This script demonstrates sum and mean operations on arrays

# Create sample arrays
arr1 = [1, 2, 3, 4, 5]
arr2 = [10, 20, 30, 40, 50]
arr3 = Float64[1.5, 2.5, 3.5, 4.5, 5.5]

println("Array Operations Demo")
println("=====================")

# Function to calculate sum
function calculate_sum(array)
    return sum(array)
end

# Function to calculate mean
function calculate_mean(array)
    return mean(array)
end

# Operations on arr1
println("Array 1: ", arr1)
println("Sum of Array 1: ", calculate_sum(arr1))
println("Mean of Array 1: ", calculate_mean(arr1))
println()

# Operations on arr2
println("Array 2: ", arr2)
println("Sum of Array 2: ", calculate_sum(arr2))
println("Mean of Array 2: ", calculate_mean(arr2))
println()

# Operations on arr3
println("Array 3: ", arr3)
println("Sum of Array 3: ", calculate_sum(arr3))
println("Mean of Array 3: ", calculate_mean(arr3))
println()

# Additional operations
println("Additional Operations:")
println("Maximum value in arr1: ", maximum(arr1))
println("Minimum value in arr1: ", minimum(arr1))
println("Length of arr1: ", length(arr1))
println("Sorted arr1: ", sort(arr1))

# 2D array example
matrix = [1 2 3; 4 5 6; 7 8 9]
println("\n2D Array (Matrix):")
println(matrix)
println("Sum of all elements in matrix: ", sum(matrix))
println("Mean of all elements in matrix: ", mean(matrix))