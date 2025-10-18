C     Fortran subroutine to calculate dot product of two vectors
      SUBROUTINE DOT_PRODUCT_VEC(A, B, N, RESULT)
C
C     Calculate the dot product of two vectors A and B
C
C     Parameters:
C     A - First vector (input)
C     B - Second vector (input)
C     N - Size of vectors (input)
C     RESULT - Dot product result (output)
C
      INTEGER N
      REAL A(N), B(N)
      REAL RESULT
C
      INTEGER I
C
      RESULT = 0.0
      DO I = 1, N
        RESULT = RESULT + A(I) * B(I)
      END DO
C
      RETURN
      END