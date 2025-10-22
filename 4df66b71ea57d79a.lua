-- Вычисление площади круга с использованием методов объектно-ориентированного программирования
Circle = {}
Circle.__index = Circle

function Circle:new(radius)
    local obj = setmetatable({}, Circle)
    obj.radius = radius
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return obj
end

function Circle:getArea()
    return math.pi * self.radius * self.radius
end

-- Пример использования
-- local myCircle = Circle:new(7)
-- print(myCircle:getArea())

return Circle
