# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Вычисляем дискриминант
    discriminant = b^2 - 4*a*c

    if discriminant > 0
        # Два различных действительных корня
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # Один действительный корень (кратный корень)
        x = -b / (2*a)
        return (x,)
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return (x1, x2)
    end
end

# Пример использования:
# a = 1
# b = -5
# c = 6
# roots = solve_quadratic(a, b, c)
# println("Корни уравнения: ", roots)