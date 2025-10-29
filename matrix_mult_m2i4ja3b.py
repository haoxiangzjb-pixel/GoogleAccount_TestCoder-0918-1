#!/usr/bin/env python3
"""
NumPy Matrix Multiplication Script
This script demonstrates matrix multiplication using NumPy.
"""

import numpy as np

def main():
    print("NumPy Matrix Multiplication Example")
    print("=" * 40)
    
    # Create two random matrices
    matrix_a = np.array([[1, 2, 3],
                         [4, 5, 6]])
    
    matrix_b = np.array([[7, 8],
                         [9, 10],
                         [11, 12]])
    
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    
    # Perform matrix multiplication using np.dot()
    result = np.dot(matrix_a, matrix_b)
    
    print("\nResult of A × B:")
    print(result)
    
    # Alternative ways to perform matrix multiplication
    print("\nAlternative methods:")
    
    # Using @ operator (Python 3.5+)
    result2 = matrix_a @ matrix_b
    print("@ operator result:")
    print(result2)
    
    # Using np.matmul()
    result3 = np.matmul(matrix_a, matrix_b)
    print("np.matmul() result:")
    print(result3)
    
    # Verify all methods give the same result
    print(f"\nAll methods give same result: {np.array_equal(result, result2) and np.array_equal(result2, result3)}")
    
    # Additional example with random matrices
    print("\n" + "=" * 40)
    print("Random 3x3 matrices example:")
    
    rand_matrix1 = np.random.rand(3, 3)
    rand_matrix2 = np.random.rand(3, 3)
    
    print("Random Matrix 1:")
    print(rand_matrix1)
    print("\nRandom Matrix 2:")
    print(rand_matrix2)
    
    rand_result = np.dot(rand_matrix1, rand_matrix2)
    print("\nProduct of random matrices:")
    print(rand_result)

if __name__ == "__main__":
    main()