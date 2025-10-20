# Julia function to solve quadratic equations
# Solves equations of the form ax^2 + bx + c = 0

function solve_quadratic(a, b, c)
    # Check if 'a' is zero (not a quadratic equation)
    if a == 0
        if b == 0
            # If both a and b are zero, there's no solution or infinite solutions
            if c == 0
                println("Infinite solutions (any x satisfies the equation)")
                return []
            else
                println("No solution (inconsistent equation)")
                return []
            end
        else
            # Linear equation: bx + c = 0
            x = -c / b
            println("Not a quadratic equation. Solution: x = $x")
            return [x]
        end
    end
    
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        println("Two real solutions:")
        println("x1 = $x1")
        println("x2 = $x2")
        return [x1, x2]
    elseif discriminant == 0
        # One real solution
        x = -b / (2*a)
        println("One real solution (repeated root):")
        println("x = $x")
        return [x]
    else
        # Complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        println("Two complex solutions:")
        println("x1 = $(real_part) + $(imaginary_part)im")
        println("x2 = $(real_part) - $(imaginary_part)im")
        return [complex(real_part, imaginary_part), complex(real_part, -imaginary_part)]
    end
end

# Example usage:
println("Example: Solve x^2 - 5x + 6 = 0")
solutions = solve_quadratic(1, -5, 6)
println("Solutions: ", solutions)

println("\nExample: Solve x^2 - 2x + 1 = 0")
solutions = solve_quadratic(1, -2, 1)
println("Solutions: ", solutions)

println("\nExample: Solve x^2 + 1 = 0")
solutions = solve_quadratic(1, 0, 1)
println("Solutions: ", solutions)