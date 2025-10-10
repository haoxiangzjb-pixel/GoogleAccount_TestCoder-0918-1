C     Subroutine to calculate the dot product of two vectors
      subroutine dot_product_fortran(n, a, b, result)
      implicit none
      integer, intent(in) :: n
      real, intent(in) :: a(n), b(n)
      real, intent(out) :: result
      integer :: i

      result = 0.0
      do i = 1, n
          result = result + a(i) * b(i)
      end do
      return
      end