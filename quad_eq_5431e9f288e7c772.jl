# Function to solve quadratic equations of the form ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Check if 'a' is zero (not a quadratic equation)
    if a == 0
        if b == 0
            # If both a and b are zero, there's no solution unless c is also zero
            if c == 0
                return "Infinite solutions (all x values satisfy the equation)"
            else
                return "No solution (inconsistent equation)"
            end
        else
            # Linear equation: bx + c = 0, so x = -c/b
            return [-c/b]
        end
    end

    # Calculate the discriminant
    discriminant = b^2 - 4*a*c

    # Determine the nature of the roots based on the discriminant
    if discriminant > 0
        # Two distinct real roots
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return [x1, x2]
    elseif discriminant == 0
        # One repeated real root
        x = -b / (2*a)
        return [x]
    else
        # Two complex roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return [x1, x2]
    end
end

# Example usage:
# println(solve_quadratic(1, -5, 6))  # Should output [3.0, 2.0]
# println(solve_quadratic(1, -2, 1))  # Should output [1.0]
# println(solve_quadratic(1, 0, 1))   # Should output [0.0 + 1.0im, 0.0 - 1.0im]