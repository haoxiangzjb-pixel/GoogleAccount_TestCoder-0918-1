-- Lua table to store student grades
local studentGrades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88
}

-- Function to calculate average grade
function calculateAverage(grades)
    local sum = 0
    local count = 0
    
    for name, grade in pairs(grades) do
        sum = sum + grade
        count = count + 1
    end
    
    if count > 0 then
        return sum / count
    else
        return 0
    end
end

-- Calculate the average grade
local averageGrade = calculateAverage(studentGrades)

-- Print the results
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", averageGrade))

-- Function to generate a random filename
function generateRandomFilename()
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local filename = "grades_"
    
    for i = 1, 8 do
        local randomIndex = math.random(1, #charset)
        filename = filename .. charset:sub(randomIndex, randomIndex)
    end
    
    filename = filename .. ".lua"
    return filename
end

-- Generate a random filename
math.randomseed(os.time())
local randomFilename = generateRandomFilename()

-- Save the data to the randomly named file
local file = io.open(randomFilename, "w")
if file then
    file:write("-- Student Grades Data\n")
    file:write("local studentGrades = {\n")
    
    for name, grade in pairs(studentGrades) do
        file:write("    [\"" .. name .. "\"] = " .. grade .. ",\n")
    end
    
    file:write("}\n\n")
    file:write("-- Average Grade: " .. string.format("%.2f", averageGrade) .. "\n")
    file:write("return studentGrades\n")
    
    file:close()
    print("\nData saved to: " .. randomFilename)
else
    print("Error: Could not create file " .. randomFilename)
end