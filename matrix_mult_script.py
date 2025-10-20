import numpy as np

def matrix_multiply():
    # Create two random matrices
    matrix_a = np.random.rand(3, 4)
    matrix_b = np.random.rand(4, 2)
    
    print("Matrix A (3x4):")
    print(matrix_a)
    print("\nMatrix B (4x2):")
    print(matrix_b)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)
    
    print("\nResult of matrix multiplication (3x2):")
    print(result)
    
    return result

if __name__ == "__main__":
    matrix_multiply()
