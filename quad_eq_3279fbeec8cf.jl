"""
Function to solve quadratic equations of the form ax^2 + bx + c = 0
Returns the solutions as a tuple (x1, x2) or appropriate values for special cases
"""
function solve_quadratic(a, b, c)
    # Check if it's actually a quadratic equation
    if a == 0
        if b == 0
            # If both a and b are 0, there's no variable term
            if c == 0
                return ("Infinite solutions", "Infinite solutions")  # 0 = 0
            else
                return ("No solution", "No solution")  # non-zero = 0
            end
        else
            # Linear equation: bx + c = 0
            x = -c / b
            return (x, x)  # Return same value twice to maintain tuple format
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # One real solution (repeated root)
        x = -b / (2*a)
        return (x, x)
    else
        # Complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return (x1, x2)
    end
end

# Example usage:
println("Example: Solving x^2 - 5x + 6 = 0")
a, b, c = 1, -5, 6
result = solve_quadratic(a, b, c)
println("Solutions: x1 = $(result[1]), x2 = $(result[2])")

println("\nExample: Solving x^2 - 2x + 1 = 0")
a, b, c = 1, -2, 1
result = solve_quadratic(a, b, c)
println("Solutions: x1 = $(result[1]), x2 = $(result[2])")

println("\nExample: Solving x^2 + 1 = 0")
a, b, c = 1, 0, 1
result = solve_quadratic(a, b, c)
println("Solutions: x1 = $(result[1]), x2 = $(result[2])")