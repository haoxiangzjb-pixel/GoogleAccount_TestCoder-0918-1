function solve_quadratic(a, b, c)
    """
    Решает квадратное уравнение ax^2 + bx + c = 0.
    Возвращает кортеж (x1, x2) или (x,) или nothing в зависимости от корней.
    """
    discriminant = b^2 - 4*a*c

    if discriminant > 0
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        x = -b / (2*a)
        return (x,)
    else
        # Нет вещественных корней
        return nothing
    end
end

# Пример использования
# a, b, c = 1, -5, 6  # x^2 - 5x + 6 = 0
# result = solve_quadratic(a, b, c)
# println(result)  # Выведет: (3.0, 2.0)