C This file contains a Fortran subroutine to calculate the dot product of two vectors.

      SUBROUTINE DOT_PRODUCT(N, A, B, RESULT)
C
C     N      : Integer, number of elements in the vectors
C     A, B   : Real arrays of size N, the input vectors
C     RESULT : Real, the calculated dot product (output)
C
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I

      RESULT = 0.0
      DO 10 I = 1, N
          RESULT = RESULT + A(I) * B(I)
   10 CONTINUE

      RETURN
      END