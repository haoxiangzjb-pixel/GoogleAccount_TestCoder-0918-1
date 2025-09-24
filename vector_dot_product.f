C This file contains a Fortran subroutine to calculate the dot product of two vectors.
      subroutine dot_product(vec1, vec2, n, result)
      implicit none
      integer n
      real vec1(n), vec2(n), result
      integer i

      result = 0.0
      do i = 1, n
         result = result + vec1(i) * vec2(i)
      end do
      return
      end