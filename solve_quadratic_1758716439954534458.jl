# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Вычисляем дискриминант
    discriminant = b^2 - 4*a*c

    if discriminant > 0
        # Два различных действительных корня
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2 * a)
        x2 = (-b - sqrt_discriminant) / (2 * a)
        return "Два корня: x1 = $x1, x2 = $x2"
    elseif discriminant == 0
        # Один действительный корень (или два совпадающих)
        x = -b / (2 * a)
        return "Один корень (два совпадающих): x = $x"
    else
        # Комплексные корни
        real_part = -b / (2 * a)
        imag_part = sqrt(-discriminant) / (2 * a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return "Комплексные корни: x1 = $x1, x2 = $x2"
    end
end

# Примеры использования
println(solve_quadratic(1, -5, 6))  # Два корня: x1 = 3.0, x2 = 2.0
println(solve_quadratic(1, -4, 4))  # Один корень: x = 2.0
println(solve_quadratic(1, 0, 1))   # Комплексные корни: x1 = 0.0 + 1.0im, x2 = 0.0 - 1.0im