import numpy as np

# Define two matrices
A = np.array([[1, 2, 3],
              [4, 5, 6]])

B = np.array([[7, 8],
              [9, 10],
              [11, 12]])

# Perform matrix multiplication using np.dot
C = np.dot(A, B)

print("Matrix A:")
print(A)
print("\nMatrix B:")
print(B)
print("\nResult of A * B:")
print(C)

# Alternative using the @ operator
C_alt = A @ B
print("\nResult using @ operator:")
print(C_alt)