"""
    solve_quadratic(a, b, c)

Решает квадратное уравнение вида ax^2 + bx + c = 0.
Возвращает кортеж (x1, x2), где x1 и x2 могут быть вещественными или комплексными числами.
"""
function solve_quadratic(a, b, c)
    discriminant = b^2 - 4*a*c
    sqrt_discriminant = sqrt(discriminant)
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)
    return (x1, x2)
end

# Пример использования:
# a = 1
# b = -5
# c = 6
# roots = solve_quadratic(a, b, c)
# println("Корни уравнения: ", roots)