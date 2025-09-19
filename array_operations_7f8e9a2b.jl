# Basic Array Operations in Julia
# This script demonstrates sum and mean calculations on arrays

using Statistics

# Create sample arrays
array1 = [1, 2, 3, 4, 5]
array2 = [10, 20, 30, 40, 50]
array3 = [2.5, 3.7, 1.2, 8.9, 5.1]

println("Array Operations Example")
println("========================")

# Display the arrays
println("Array 1: ", array1)
println("Array 2: ", array2)
println("Array 3: ", array3)

# Calculate and display sums
sum1 = sum(array1)
sum2 = sum(array2)
sum3 = sum(array3)

println("\nSum Operations:")
println("Sum of Array 1: ", sum1)
println("Sum of Array 2: ", sum2)
println("Sum of Array 3: ", sum3)

# Calculate and display means
mean1 = mean(array1)
mean2 = mean(array2)
mean3 = mean(array3)

println("\nMean Operations:")
println("Mean of Array 1: ", mean1)
println("Mean of Array 2: ", mean2)
println("Mean of Array 3: ", mean3)

# Perform operations on concatenated arrays
combined_array = vcat(array1, array2, array3)
println("\nCombined Array: ", combined_array)
println("Sum of Combined Array: ", sum(combined_array))
println("Mean of Combined Array: ", mean(combined_array))

# Element-wise operations
println("\nElement-wise Operations:")
element_wise_sum = array1 + array2[1:5]  # Adding first 5 elements of array2 to array1
println("Element-wise sum (Array1 + first 5 of Array2): ", element_wise_sum)