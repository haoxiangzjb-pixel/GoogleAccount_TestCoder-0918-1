import numpy as np

# Create two matrices
matrix1 = np.array([[1, 2, 3],
                    [4, 5, 6]])

matrix2 = np.array([[7, 8],
                    [9, 10],
                    [11, 12]])

# Perform matrix multiplication using @ operator (Python 3.5+)
result = matrix1 @ matrix2

print("Matrix 1 (2x3):")
print(matrix1)
print("\nMatrix 2 (3x2):")
print(matrix2)
print("\nResult of multiplication (2x2):")
print(result)

# Verify with np.dot
result_dot = np.dot(matrix1, matrix2)
print("\nVerification with np.dot:")
print(result_dot)
print("\nAre results equal?", np.array_equal(result, result_dot))