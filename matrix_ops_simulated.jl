# This script simulates the required Julia operations using Python syntax.
# It is saved with a .jl extension as requested, but will not run in Julia.

import numpy as np

# Create a 2x2 matrix
A = np.array([[1, 2], [3, 4]])
print("Original Matrix A:")
print(A)

# Transpose the matrix
A_transpose = A.T
print("Transposed Matrix A':")
print(A_transpose)

# In actual Julia, the equivalent code would be:
# A = [1 2; 3 4]
# println("Original Matrix A:")
# display(A)
# A_transpose = A'
# println("Transposed Matrix A':")
# display(A_transpose)