"""
Solves a quadratic equation of the form ax^2 + bx + c = 0
Returns the roots of the equation.

Parameters:
- a: coefficient of x^2
- b: coefficient of x
- c: constant term

Returns:
- A tuple containing the roots. For real roots, returns (root1, root2).
  For complex roots, returns (root1, root2) as complex numbers.
  For a linear equation (a=0), returns the single root.
  For invalid inputs (a=b=0), returns nothing.
"""
function solve_quadratic(a, b, c)
    # Handle the case where a = 0 (linear equation)
    if a == 0
        if b == 0
            # No solution or infinite solutions
            if c == 0
                println("Infinite solutions (0 = 0)")
                return nothing
            else
                println("No solution ($c ≠ 0)")
                return nothing
            end
        else
            # Linear equation: bx + c = 0
            root = -c / b
            println("Linear equation with root: x = $root")
            return root
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two distinct real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        println("Two real roots: x₁ = $root1, x₂ = $root2")
        return (root1, root2)
    elseif discriminant == 0
        # One repeated real root
        root = -b / (2*a)
        println("One repeated real root: x = $root")
        return (root, root)
    else
        # Two complex roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        root1 = Complex(real_part, imaginary_part)
        root2 = Complex(real_part, -imaginary_part)
        println("Two complex roots: x₁ = $root1, x₂ = $root2")
        return (root1, root2)
    end
end

# Example usage:
# solve_quadratic(1, -3, 2)   # Two real roots
# solve_quadratic(1, -2, 1)   # One repeated root
# solve_quadratic(1, 0, 1)    # Two complex roots
# solve_quadratic(0, 2, -4)   # Linear equation