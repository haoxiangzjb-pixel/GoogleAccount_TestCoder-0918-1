-- Модуль для математических вычислений
local math_utils = {}

-- Константа для вычисления площади круга
local PI = math.pi

-- Функция для вычисления площади круга
math_utils.circle_area = function(radius)
    if not radius or type(radius) ~= "number" then
        error("Параметр radius должен быть числом")
    end
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return PI * radius * radius
end

-- Альтернативная реализация с округлением до 2 знаков после запятой
math_utils.circle_area_rounded = function(radius)
    local area = math_utils.circle_area(radius)
    return math.floor(area * 100 + 0.5) / 100
end

return math_utils
