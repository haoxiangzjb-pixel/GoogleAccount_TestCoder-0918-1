! Test program for the dot product subroutine
      program test_dot_product
      implicit none
      
      ! Array size
      integer, parameter :: n = 3
      
      ! Test vectors
      real :: vector1(n) = (/ 1.0, 2.0, 3.0 /)
      real :: vector2(n) = (/ 4.0, 5.0, 6.0 /)
      real :: result
      
      ! Call the subroutine
      call calculate_dot_product(vector1, vector2, n, result)
      
      ! Print the result
      print *, 'Vector 1: ', vector1
      print *, 'Vector 2: ', vector2
      print *, 'Dot product: ', result
      
      end program test_dot_product

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