# Julia script to create a matrix and perform transpose operation

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

# Generate a random filename
using Random
random_filename = "matrix_transpose_$(randstring(8)).jl"

# Write the code to the file
code = """# Julia script to create a matrix and perform transpose operation

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
"""

write(random_filename, code)
println("Script saved to: $random_filename")