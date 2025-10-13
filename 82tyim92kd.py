import numpy as np

# Define two random 3x3 matrices
A = np.random.rand(3, 3)
B = np.random.rand(3, 3)

print("Matrix A:")
print(A)
print("\nMatrix B:")
print(B)

# Perform matrix multiplication
C = np.dot(A, B)
# Alternatively, you can use the @ operator: C = A @ B

print("\nResult of A * B (matrix multiplication):")
print(C)
