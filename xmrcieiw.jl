# Julia script for basic array operations

# Function to calculate the sum of an array
function array_sum(arr)
    return sum(arr)
end

# Function to calculate the mean of an array
function array_mean(arr)
    return mean(arr)
end

# Function to calculate both sum and mean
function array_stats(arr)
    s = array_sum(arr)
    m = array_mean(arr)
    return s, m
end

# Example usage
println("Array Operations in Julia")
println("========================")

# Create a sample array
sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
println("Sample array: ", sample_array)

# Calculate sum
total_sum = array_sum(sample_array)
println("Sum: ", total_sum)

# Calculate mean
avg = array_mean(sample_array)
println("Mean: ", avg)

# Calculate both using the combined function
s, m = array_stats(sample_array)
println("Sum and Mean (from combined function): ", s, ", ", m)

# Additional example with a random array
println("\nRandom Array Example:")
random_array = rand(1:100, 5)
println("Random array: ", random_array)
s2, m2 = array_stats(random_array)
println("Sum: ", s2, ", Mean: ", m2)