-- Function to calculate the area of a circle
-- Parameter: radius (number) - the radius of the circle
-- Returns: area (number) - the area of the circle

function calculateCircleArea(radius)
    -- Check if radius is a positive number
    if type(radius) ~= "number" or radius <= 0 then
        error("Radius must be a positive number")
    end
    
    -- Calculate area using the formula A = π * r²
    local area = math.pi * radius * radius
    return area
end

-- Example usage:
-- local area = calculateCircleArea(5)
-- print("Area of circle with radius 5 is: " .. area)