# Basic Array Operations in Julia

# Function to calculate the sum of an array
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate the mean of an array
function calculate_mean(arr)
    return mean(arr)
end

# Example usage
numbers = [10, 20, 30, 40, 50]

println("Array: ", numbers)
println("Sum: ", calculate_sum(numbers))
println("Mean: ", calculate_mean(numbers))
