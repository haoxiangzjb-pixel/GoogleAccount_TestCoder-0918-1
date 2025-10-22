--[[ 
Файл: circle_calculator.lua
Назначение: вычисление площади круга
Автор: Assistant
Дата: 2025
--]]

-- Локальная область видимости для модуля
local CircleCalculator = {}

-- Константа π
local PI = 3.141592653589793

-- Основная функция для вычисления площади круга
function CircleCalculator.area(radius)
    -- Проверка на nil
    if radius == nil then
        error("Ошибка: радиус не может быть nil")
    end
    
    -- Проверка на тип
    if type(radius) ~= "number" then
        error("Ошибка: радиус должен быть числовым значением, получено: " .. type(radius))
    end
    
    -- Проверка на отрицательное значение
    if radius < 0 then
        error("Ошибка: радиус не может быть отрицательным, получено: " .. radius)
    end
    
    -- Вычисление площади
    local area = PI * radius * radius
    
    -- Возвращаем результат
    return area
end

-- Альтернативная функция с форматированием результата
function CircleCalculator.areaFormatted(radius, decimalPlaces)
    decimalPlaces = decimalPlaces or 2
    local area = CircleCalculator.area(radius)
    return string.format("%." .. decimalPlaces .. "f", area)
end

-- Экспорт модуля
return CircleCalculator
