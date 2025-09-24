program dot_product_test
    implicit none
    integer, parameter :: n = 3
    real, dimension(n) :: vec1 = [1.0, 2.0, 3.0]
    real, dimension(n) :: vec2 = [4.0, 5.0, 6.0]
    real :: result

    call calculate_dot_product(vec1, vec2, n, result)
    print *, 'The dot product is: ', result

end program dot_product_test

subroutine calculate_dot_product(a, b, size, dot_product_result)
    implicit none
    integer, intent(in) :: size
    real, dimension(size), intent(in) :: a, b
    real, intent(out) :: dot_product_result
    integer :: i

    dot_product_result = 0.0
    do i = 1, size
        dot_product_result = dot_product_result + a(i) * b(i)
    end do

end subroutine calculate_dot_product