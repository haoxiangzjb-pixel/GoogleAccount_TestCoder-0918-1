      SUBROUTINE DOT_PRODUCT_SUB(A, B, N, RESULT)
      IMPLICIT NONE
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I

      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      END DO

      RETURN
      END
