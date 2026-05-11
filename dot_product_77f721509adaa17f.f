      SUBROUTINE DOT_PRODUCT_VEC(A, B, N, RESULT)
C     计算两个向量的点积
C     输入:
C       A - 第一个向量 (双精度实数数组)
C       B - 第二个向量 (双精度实数数组)
C       N - 向量长度
C     输出:
C       RESULT - 点积结果 (双精度实数)
      
      IMPLICIT NONE
      INTEGER N, I
      DOUBLE PRECISION A(N), B(N), RESULT
      
      RESULT = 0.0D0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      END DO
      
      RETURN
      END
