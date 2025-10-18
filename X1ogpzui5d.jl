# Julia script to create a matrix and perform transpose operation

# Create a sample matrix
A = [1 2 3; 4 5 6; 7 8 9]

println("Original matrix A:")
display(A)

# Perform transpose operation
A_transpose = transpose(A)
# Alternative syntax: A_transpose = A'

println("\nTransposed matrix A':")
display(A_transpose)

# Create another example with a non-square matrix
B = [1 2 3 4; 5 6 7 8]

println("\nOriginal matrix B:")
display(B)

B_transpose = B'

println("\nTransposed matrix B':")
display(B_transpose)

# Demonstrate that (A^T)^T = A
A_double_transpose = A''

println("\nDouble transpose of A (should equal original A):")
display(A_double_transpose)

println("\nVerification that A equals its double transpose: ", A == A_double_transpose)