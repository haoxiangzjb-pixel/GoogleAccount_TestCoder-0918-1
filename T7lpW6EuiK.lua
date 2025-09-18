-- Функция для вычисления площади круга
function calculate_circle_area(radius)
    -- Проверка, что радиус положительный
    if radius <= 0 then
        error("Радиус должен быть положительным числом")
    end
    
    -- Вычисление площади круга по формуле A = π * r^2
    local area = math.pi * radius * radius
    
    return area
end

-- Пример использования функции
local radius = 5
local area = calculate_circle_area(radius)
print("Площадь круга с радиусом " .. radius .. " равна " .. area)