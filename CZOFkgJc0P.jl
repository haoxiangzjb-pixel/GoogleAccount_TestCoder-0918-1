# Julia script to create a matrix and perform transpose operation

# Create a sample matrix
matrix = [1 2 3; 4 5 6; 7 8 9]

println("Original matrix:")
display(matrix)
println()

# Perform transpose operation
transposed_matrix = transpose(matrix)

println("Transposed matrix:")
display(transposed_matrix)
println()

# Alternative syntax for transpose
transposed_matrix_alt = matrix'

println("Transposed matrix using ' operator:")
display(transposed_matrix_alt)
println()

# Create another example with a non-square matrix
rect_matrix = [1 2 3 4; 5 6 7 8]

println("Original rectangular matrix:")
display(rect_matrix)
println()

println("Transposed rectangular matrix:")
display(transpose(rect_matrix))
println()