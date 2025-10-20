C     Fortran subroutine to calculate the dot product of two vectors
      SUBROUTINE DOT_PRODUCT_VEC(A, B, N, RESULT)
      IMPLICIT NONE
      
C     Declare variables
      INTEGER N, I
      REAL A(N), B(N), RESULT
      
C     Initialize result to zero
      RESULT = 0.0
      
C     Calculate the dot product
      DO I = 1, N
        RESULT = RESULT + A(I) * B(I)
      END DO
      
      RETURN
      END