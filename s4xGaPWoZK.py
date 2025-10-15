import numpy as np

def matrix_multiplication_demo():
    """
    This script demonstrates matrix multiplication using NumPy.
    It creates two random matrices and multiplies them together.
    """
    print("Matrix Multiplication using NumPy")
    
    # Create two random matrices
    matrix_a = np.random.rand(3, 4)  # 3x4 matrix
    matrix_b = np.random.rand(4, 2)  # 4x2 matrix
    
    print("Matrix A (3x4):")
    print(matrix_a)
    print("\nMatrix B (4x2):")
    print(matrix_b)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)  # or equivalently: result = matrix_a @ matrix_b
    
    print("\nResult of A × B (3x2):")
    print(result)
    
    # Verify dimensions
    print(f"\nDimensions: A{matrix_a.shape} × B{matrix_b.shape} = Result{result.shape}")
    
    # Additional example with integer matrices
    print("\n" + "="*50)
    print("Additional example with integer matrices:")
    
    int_matrix_a = np.array([[1, 2, 3],
                             [4, 5, 6]])
    int_matrix_b = np.array([[7, 8],
                             [9, 10],
                             [11, 12]])
    
    print("Integer Matrix A:")
    print(int_matrix_a)
    print("\nInteger Matrix B:")
    print(int_matrix_b)
    
    int_result = int_matrix_a @ int_matrix_b  # Using @ operator for matrix multiplication
    print("\nResult of Integer A × Integer B:")
    print(int_result)

if __name__ == "__main__":
    matrix_multiplication_demo()