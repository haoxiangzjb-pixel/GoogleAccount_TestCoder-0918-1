C This file contains a Fortran subroutine to calculate the dot product of two vectors.

      SUBROUTINE DOT_PRODUCT(N, A, B, RESULT)
C
C     This subroutine calculates the dot product of two vectors A and B.
C
C     Input:
C     N      - Integer, the number of elements in the vectors.
C     A      - Real array of size N, the first vector.
C     B      - Real array of size N, the second vector.
C
C     Output:
C     RESULT - Real, the calculated dot product.
C
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I

      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      END DO

      RETURN
      END