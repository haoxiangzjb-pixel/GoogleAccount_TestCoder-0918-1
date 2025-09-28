-- Функция для вычисления площади круга
function calculate_circle_area(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    local pi = 3.14159
    return pi * radius * radius
end

-- Пример использования функции
-- print(calculate_circle_area(5))