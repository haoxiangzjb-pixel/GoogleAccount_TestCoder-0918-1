-- Функция для вычисления площади круга
function calculate_circle_area(radius)
    -- Проверка на отрицательный радиус
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    
    -- Вычисление площади по формуле S = π * r^2
    local area = math.pi * radius * radius
    return area
end

-- Пример использования функции
local radius = 5
local area = calculate_circle_area(radius)
print("Площадь круга с радиусом " .. radius .. " равна " .. area)