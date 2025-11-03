function solve_quadratic(a, b, c)
    """
    Solve quadratic equation ax^2 + bx + c = 0
    Returns a tuple of the two solutions (real or complex)
    """
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # One repeated real solution
        x = -b / (2*a)
        return (x, x)
    else
        # Two complex solutions
        sqrt_discriminant = sqrt(Complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Example usage:
# println(solve_quadratic(1, -5, 6))  # Should give (3.0, 2.0)
# println(solve_quadratic(1, 0, 1))   # Should give complex solutions
# println(solve_quadratic(1, -2, 1))  # Should give (1.0, 1.0)