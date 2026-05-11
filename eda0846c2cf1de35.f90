program circle_area
    implicit none
    real :: radius, area
    real, parameter :: pi = 3.14159265358979

    ! Prompt user for radius
    print *, "Enter the radius of the circle:"
    read *, radius

    ! Calculate area
    area = pi * radius**2

    ! Display result
    print *, "The area of the circle is:", area

end program circle_area
