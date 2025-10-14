function solve_quadratic(a, b, c)
    # Вычисляем дискриминант
    discriminant = b^2 - 4*a*c

    if discriminant > 0
        # Два различных действительных корня
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # Один действительный корень (или два одинаковых)
        x = -b / (2*a)
        return (x, x)
    else
        # Комплексные корни
        sqrt_discriminant = sqrt(complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Пример использования:
# a, b, c = 1, -5, 6  # x^2 - 5x + 6 = 0
# roots = solve_quadratic(a, b, c)
# println("Корни уравнения: ", roots)