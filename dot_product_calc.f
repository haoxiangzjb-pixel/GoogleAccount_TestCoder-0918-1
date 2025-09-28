C This file contains a Fortran subroutine to calculate the dot product of two vectors.
      SUBROUTINE DOT_PRODUCT(A, B, N, RESULT)
C
C     A: First input vector (REAL array of size N)
C     B: Second input vector (REAL array of size N)
C     N: Size of the vectors (INTEGER)
C     RESULT: The calculated dot product (REAL)
C
      REAL A(N), B(N), RESULT
      INTEGER N, I
C
      RESULT = 0.0
      DO 10 I = 1, N
          RESULT = RESULT + A(I) * B(I)
   10 CONTINUE
      RETURN
      END