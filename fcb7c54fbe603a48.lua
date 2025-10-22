-- Функция для вычисления площади круга
function circle_area(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования
-- print(circle_area(5))
