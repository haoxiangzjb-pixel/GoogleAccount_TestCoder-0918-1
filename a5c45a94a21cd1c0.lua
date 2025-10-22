-- Функция Lua для вычисления площади круга
local Circle = {}

function Circle.area(radius)
    if radius <= 0 then
        error("Радиус должен быть положительным числом")
    end
    return math.pi * radius^2
end

-- Пример использования
-- print(Circle.area(10))

return Circle
