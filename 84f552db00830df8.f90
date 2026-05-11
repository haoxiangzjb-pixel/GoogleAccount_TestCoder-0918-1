program circle_area
    implicit none
    real :: radius, area
    real, parameter :: pi = 3.141592653589793

    print *, "Enter the radius of the circle:"
    read *, radius

    area = pi * radius**2

    print *, "The area of the circle is:", area
end program circle_area
