-- Function to calculate the area of a circle
function calculate_circle_area(radius)
    -- Check if the radius is valid
    if radius < 0 then
        error("Radius cannot be negative")
    end
    -- Calculate and return the area
    return math.pi * radius * radius
end

-- Example usage:
-- local area = calculate_circle_area(5)
-- print("Area of the circle: " .. area)