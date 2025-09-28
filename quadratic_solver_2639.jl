function solve_quadratic(a, b, c)
    """
    Решает квадратное уравнение ax^2 + bx + c = 0.
    Возвращает кортеж (x1, x2), где x1 и x2 могут быть комплексными числами.
    """
    discriminant = b^2 - 4*a*c

    # Вычисляем корни, используя формулу
    sqrt_discriminant = sqrt(complex(discriminant)) # Используем complex() для обработки отрицательного дискриминанта
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)

    return x1, x2
end

# Пример использования
# a = 1.0
# b = -5.0
# c = 6.0
# roots = solve_quadratic(a, b, c)
# println("Корни уравнения $a*x^2 + $b*x + $c = 0: $roots")