--- Модуль для вычисления геометрических величин
-- @module geometry
local geometry = {}

--- Вычисляет площадь круга
-- @param radius Радиус круга (должен быть положительным)
-- @return Площадь круга
function geometry.circle_area(radius)
    if type(radius) ~= "number" then
        error("Радиус должен быть числом")
    end
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * math.pow(radius, 2)
end

return geometry
