C This file contains a Fortran subroutine to calculate the dot product of two vectors.
      subroutine calculate_dot_product(vector_a, vector_b, n, result)
      implicit none
      integer n
      real vector_a(n), vector_b(n), result
      integer i

      result = 0.0
      do i = 1, n
         result = result + vector_a(i) * vector_b(i)
      end do
      return
      end