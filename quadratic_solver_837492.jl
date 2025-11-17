"""
Функция для решения квадратного уравнения вида ax^2 + bx + c = 0
Возвращает корни уравнения в виде кортежа (x1, x2)
"""
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
        return (x, x)
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        return (x1, x2)
    end
end

# Примеры использования
println("Пример 1: x^2 - 5x + 6 = 0")
roots1 = solve_quadratic(1, -5, 6)
println("Корни: ", roots1)

println("\nПример 2: x^2 - 2x + 1 = 0")
roots2 = solve_quadratic(1, -2, 1)
println("Корни: ", roots2)

println("\nПример 3: x^2 + x + 1 = 0")
roots3 = solve_quadratic(1, 1, 1)
println("Корни: ", roots3)