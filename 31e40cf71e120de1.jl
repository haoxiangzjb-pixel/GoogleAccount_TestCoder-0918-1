# Basic Array Operations in Julia
# This script demonstrates common array operations like sum and mean

using Statistics

# Create sample arrays
arr1 = [1, 2, 3, 4, 5]
arr2 = [10, 20, 30, 40, 50]
arr3 = [1.5, 2.7, 3.2, 4.8, 5.1]

println("Array Operations Examples")
println("========================")

# Sum operations
println("Sum of arr1: ", sum(arr1))
println("Sum of arr2: ", sum(arr2))
println("Sum of arr3: ", sum(arr3))

# Mean operations
println("Mean of arr1: ", mean(arr1))
println("Mean of arr2: ", mean(arr2))
println("Mean of arr3: ", mean(arr3))

# Additional operations
println("Length of arr1: ", length(arr1))
println("Maximum value in arr2: ", maximum(arr2))
println("Minimum value in arr3: ", minimum(arr3))

# Element-wise operations
println("Element-wise square of arr1: ", arr1 .^ 2)
println("Element-wise square root of arr2: ", sqrt.(arr2))