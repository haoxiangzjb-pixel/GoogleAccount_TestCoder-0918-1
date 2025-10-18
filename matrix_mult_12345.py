import numpy as np

def matrix_multiply(A, B):
    """
    Perform matrix multiplication of two numpy arrays.
    
    Parameters:
    A (numpy.ndarray): First matrix
    B (numpy.ndarray): Second matrix
    
    Returns:
    numpy.ndarray: Result of matrix multiplication A @ B
    """
    return np.dot(A, B)
    # Alternatively: return A @ B

# Example usage
if __name__ == "__main__":
    # Create two random matrices
    A = np.random.rand(3, 4)
    B = np.random.rand(4, 2)
    
    print("Matrix A:")
    print(A)
    print("\nMatrix B:")
    print(B)
    
    # Perform matrix multiplication
    result = matrix_multiply(A, B)
    
    print("\nResult of A @ B:")
    print(result)
    
    # Verify dimensions
    print(f"\nDimensions: A{A.shape} @ B{B.shape} = Result{result.shape}")