-- Функция для вычисления площади круга по радиусу
function calculateCircleArea(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования
local radius = 5
local area = calculateCircleArea(radius)
print("Площадь круга с радиусом " .. radius .. " равна " .. area)