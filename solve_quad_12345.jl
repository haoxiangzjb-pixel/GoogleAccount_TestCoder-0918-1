function solve_quadratic(a, b, c)
    discriminant = b^2 - 4*a*c
    if discriminant > 0
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        x = -b / (2*a)
        return (x,)
    else
        sqrt_discriminant = sqrt(complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Example usage:
# coeffs = (1.0, -5.0, 6.0) # x^2 - 5x + 6 = 0
# sol = solve_quadratic(coeffs...)
# println(sol) # Should print (3.0, 2.0)