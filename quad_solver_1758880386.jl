function solve_quadratic(a, b, c)
    """
    Решает квадратное уравнение ax^2 + bx + c = 0.
    Возвращает кортеж из двух корней (x1, x2), которые могут быть вещественными или комплексными числами.
    """
    # Вычисляем дискриминант
    D = b^2 - 4*a*c

    # Проверяем знак дискриминанта
    if D >= 0
        # Вещественные корни
        sqrt_D = sqrt(D)
        x1 = (-b + sqrt_D) / (2*a)
        x2 = (-b - sqrt_D) / (2*a)
    else
        # Комплексные корни
        sqrt_D = sqrt(complex(D))
        x1 = (-b + sqrt_D) / (2*a)
        x2 = (-b - sqrt_D) / (2*a)
    end

    return x1, x2
end

# Пример использования:
# a = 1
# b = -5
# c = 6
# roots = solve_quadratic(a, b, c)
# println("Корни уравнения: ", roots)