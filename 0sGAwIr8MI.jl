"""
Solves a quadratic equation of the form ax^2 + bx + c = 0.
Returns a tuple containing the solutions.
"""
function solve_quadratic(a, b, c)
    # Check if it's a quadratic equation
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions"
            else
                return "No solution"
            end
        else
            # Linear equation: bx + c = 0
            return (-c / b,)
        end
    end
    
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        # One real solution
        root = -b / (2*a)
        return (root,)
    else
        # Complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        return (Complex(real_part, imaginary_part), Complex(real_part, -imaginary_part))
    end
end