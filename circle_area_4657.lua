-- Функция для вычисления площади круга
function calculateCircleArea(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования
local r = 5
local area = calculateCircleArea(r)
print("Площадь круга с радиусом " .. r .. " равна " .. area)