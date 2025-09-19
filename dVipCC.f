! This Fortran subroutine calculates the dot product of two vectors.
! It takes two real vectors X and Y of size N and returns the dot product in DOT.

      SUBROUTINE SDOT(N, X, Y, DOT)
      INTEGER N
      REAL X(N), Y(N), DOT
      INTEGER I

      DOT = 0.0
      DO I = 1, N
         DOT = DOT + X(I) * Y(I)
      END DO

      RETURN
      END