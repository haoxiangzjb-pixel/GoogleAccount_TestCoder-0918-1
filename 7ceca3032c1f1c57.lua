#!/usr/bin/env lua

-- Пространство имен для геометрических вычислений
local Geometry = {}

-- Вычисляет площадь круга
-- @param radius Радиус круга
-- @return Площадь круга
Geometry.compute_circle_area = function(radius)
    -- Проверяем, является ли радиус числом
    if type(radius) ~= "number" then
        error("Ошибка: радиус должен быть числовым значением")
    end
    
    -- Проверяем, является ли радиус неотрицательным
    if radius < 0 then
        error("Ошибка: радиус не может быть отрицательным")
    end
    
    -- Вычисляем площадь по формуле: π * r^2
    local area = math.pi * radius * radius
    
    return area
end

-- Тестирование функции
if arg and arg[0] and arg[0]:find("compute_circle_area") then
    print("Площадь круга с радиусом 5: " .. Geometry.compute_circle_area(5))
end

return Geometry
