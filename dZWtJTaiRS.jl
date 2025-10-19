# Create a sample matrix
matrix = [1 2 3; 4 5 6; 7 8 9]

println("Original Matrix:")
display(matrix)
println()

# Perform transpose operation
transposed_matrix = transpose(matrix)

println("Transposed Matrix:")
display(transposed_matrix)
println()

# Alternative syntax for transpose
transposed_matrix_alt = matrix'  # Using the ' operator for transpose

println("Transposed Matrix (using ' operator):")
display(transposed_matrix_alt)
println()

# Create another example with a non-square matrix
rect_matrix = [1 2 3 4; 5 6 7 8]

println("Original Rectangular Matrix:")
display(rect_matrix)
println()

println("Transposed Rectangular Matrix:")
display(transpose(rect_matrix))
println()