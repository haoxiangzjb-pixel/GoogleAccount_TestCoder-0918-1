import numpy as np

def matrix_multiplication_demo():
    """
    Demonstrates matrix multiplication using NumPy
    """
    print("Matrix Multiplication using NumPy")
    print("="*35)
    
    # Create two random matrices
    matrix_a = np.random.rand(3, 4)  # 3x4 matrix
    matrix_b = np.random.rand(4, 2)  # 4x2 matrix
    
    print("Matrix A (3x4):")
    print(matrix_a)
    print("\nMatrix B (4x2):")
    print(matrix_b)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)  # or np.matmul(matrix_a, matrix_b)
    
    print("\nResult of A * B (3x2):")
    print(result)
    
    # Verify dimensions
    print(f"\nDimensions check: {matrix_a.shape} * {matrix_b.shape} = {result.shape}")
    
    return result

if __name__ == "__main__":
    matrix_multiplication_demo()