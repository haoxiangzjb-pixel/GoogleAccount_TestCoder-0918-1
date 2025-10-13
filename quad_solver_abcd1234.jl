@doc """
Решает квадратное уравнение a*x^2 + b*x + c = 0.

# Arguments
- `a`: коэффициент при x^2
- `b`: коэффициент при x
- `c`: свободный член

# Returns
- Кортеж из двух комплексных чисел, представляющих корни уравнения.
  Если дискриминант отрицательный, корни будут комплексными.
  Если a = 0, будет выброшена ошибка.
""" ->
function solve_quadratic(a, b, c)
    if a == 0
        error("Коэффициент 'a' не может быть равен нулю для квадратного уравнения.")
    end
    discriminant = b^2 - 4*a*c
    sqrt_discriminant = sqrt(Complex(discriminant))
    root1 = (-b + sqrt_discriminant) / (2*a)
    root2 = (-b - sqrt_discriminant) / (2*a)
    return (root1, root2)
end

# Пример использования
# a, b, c = 1, -5, 6
# roots = solve_quadratic(a, b, c)
# println("Корни уравнения: ", roots)