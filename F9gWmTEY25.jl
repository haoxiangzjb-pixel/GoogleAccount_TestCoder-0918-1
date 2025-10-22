# Function to solve quadratic equation ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Check if it's actually a quadratic equation
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions (0=0)"
            else
                return "No solution (contradiction)"
            end
        else
            # Linear equation: bx + c = 0
            x = -c / b
            return [x]
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return [x1, x2]
    elseif discriminant == 0
        # One real solution
        x = -b / (2*a)
        return [x]
    else
        # Two complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return [x1, x2]
    end
end

# Example usage
println("Example: Solving x^2 - 5x + 6 = 0")
result = solve_quadratic(1, -5, 6)
println("Solutions: ", result)

println("\nExample: Solving x^2 - 2x + 1 = 0")
result = solve_quadratic(1, -2, 1)
println("Solutions: ", result)

println("\nExample: Solving x^2 + 1 = 0")
result = solve_quadratic(1, 0, 1)
println("Solutions: ", result)