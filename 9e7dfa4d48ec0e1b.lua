-- Lua функция для вычисления площади круга
local function calculateArea(radius)
    if radius < 0 then
        error("Радиус должен быть неотрицательным числом")
    end
    return math.pi * radius * radius
end

-- Экспортируем функцию
return {
    circle_area = calculateArea
}
