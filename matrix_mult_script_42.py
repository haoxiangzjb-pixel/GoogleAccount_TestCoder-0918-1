import numpy as np

def matrix_multiplication_example():
    # Create two random matrices
    A = np.random.rand(3, 4)
    B = np.random.rand(4, 3)
    
    # Perform matrix multiplication
    C = np.dot(A, B)
    
    print("Matrix A (3x4):")
    print(A)
    print("\nMatrix B (4x3):")
    print(B)
    print("\nMatrix C = A × B (3x3):")
    print(C)
    
    # Demonstrate element-wise multiplication for comparison
    print("\nElement-wise multiplication (A[:, :3] * B[:3, :]) for comparison:")
    print(A[:, :3] * B[:3, :])

if __name__ == "__main__":
    matrix_multiplication_example()