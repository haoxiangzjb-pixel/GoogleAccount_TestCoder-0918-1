"""
Function to solve quadratic equations of the form ax² + bx + c = 0
Returns the solutions as a tuple (x1, x2) where x1 and x2 may be real or complex numbers
"""
function solve_quadratic(a, b, c)
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    # Calculate the two solutions using the quadratic formula
    sqrt_discriminant = sqrt(complex(discriminant))  # Use complex to handle negative discriminants
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)
    
    return x1, x2
end

# Example usage:
println("Example: Solving x² - 5x + 6 = 0 (a=1, b=-5, c=6)")
solutions = solve_quadratic(1, -5, 6)
println("Solutions: x1 = $(solutions[1]), x2 = $(solutions[2])")

println("\nExample: Solving x² + 2x + 5 = 0 (a=1, b=2, c=5) - Complex solutions")
solutions = solve_quadratic(1, 2, 5)
println("Solutions: x1 = $(solutions[1]), x2 = $(solutions[2])")

println("\nExample: Solving 2x² - 4x + 2 = 0 (a=2, b=-4, c=2) - Equal solutions")
solutions = solve_quadratic(2, -4, 2)
println("Solutions: x1 = $(solutions[1]), x2 = $(solutions[2])")