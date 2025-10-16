"""
Функция для решения квадратного уравнения вида ax^2 + bx + c = 0
Возвращает кортеж (x1, x2), где x1 и x2 могут быть комплексными числами
"""
function solve_quadratic(a::Number, b::Number, c::Number)
    discriminant = b^2 - 4*a*c
    sqrt_discriminant = sqrt(complex(discriminant))
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)
    return (x1, x2)
end

# Пример использования
println("Пример решения уравнения: 1x^2 - 5x + 6 = 0")
roots = solve_quadratic(1, -5, 6)
println("Корни: ", roots[1], " и ", roots[2])