C This file contains a Fortran subroutine to calculate the dot product of two vectors.

      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
C
C     This subroutine calculates the dot product of two vectors A and B.
C
C     Parameters:
C     N      - INTEGER - The number of elements in the vectors.
C     A      - REAL*8  - The first vector.
C     B      - REAL*8  - The second vector.
C     RESULT - REAL*8  - The output variable to store the dot product.
C
      INTEGER N
      REAL*8  A(N), B(N), RESULT
C
      INTEGER I
C
C     Initialize the result to zero.
      RESULT = 0.0D0
C
C     Calculate the dot product.
      DO I = 1, N
          RESULT = RESULT + A(I) * B(I)
      END DO
C
      RETURN
      END