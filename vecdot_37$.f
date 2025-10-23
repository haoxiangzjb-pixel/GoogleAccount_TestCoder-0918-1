! Fortran subroutine to calculate the dot product of two vectors
      subroutine calculate_dot_product(vec1, vec2, n, result)
      implicit none
      
      ! Input parameters
      integer, intent(in) :: n                    ! Size of vectors
      real, intent(in) :: vec1(n), vec2(n)       ! Input vectors
      real, intent(out) :: result                ! Dot product result
      
      ! Local variables
      integer :: i
      real :: sum
      
      ! Calculate the dot product
      sum = 0.0
      do i = 1, n
         sum = sum + vec1(i) * vec2(i)
      end do
      
      result = sum
      
      end subroutine calculate_dot_product