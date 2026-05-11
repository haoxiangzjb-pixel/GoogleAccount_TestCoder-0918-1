      SUBROUTINE DOT_PRODUCT_VEC(A, B, N, RESULT)
C     计算两个向量的点积
C     A, B: 输入向量
C     N: 向量长度
C     RESULT: 点积结果
      IMPLICIT NONE
      INTEGER N, I
      REAL*8 A(N), B(N), RESULT
      
      RESULT = 0.0D0
      DO I = 1, N
          RESULT = RESULT + A(I) * B(I)
      END DO
      
      RETURN
      END
