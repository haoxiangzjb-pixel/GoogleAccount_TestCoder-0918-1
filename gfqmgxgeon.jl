"""
Solve a quadratic equation of the form ax^2 + bx + c = 0
Returns a tuple with the solutions, or a message if no real solutions exist
"""
function solve_quadratic(a, b, c)
    # Check if it's actually a quadratic equation
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions (0=0)"
            else
                return "No solution"
            end
        else
            # Linear equation: bx + c = 0
            return (-c / b,)
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two distinct real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        # One repeated real root
        root = -b / (2*a)
        return (root,)
    else
        # No real roots (complex roots)
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        return (
            string(real_part, " + ", imaginary_part, "i"),
            string(real_part, " - ", imaginary_part, "i")
        )
    end
end

# Example usage:
# println(solve_quadratic(1, -3, 2))  # Should give (2.0, 1.0)
# println(solve_quadratic(1, -2, 1))  # Should give (1.0,)
# println(solve_quadratic(1, 0, 1))   # Should give complex roots