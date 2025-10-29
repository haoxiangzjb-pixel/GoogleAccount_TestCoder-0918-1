-- Function to generate a random string
local function randomString(length)
    local result = {}
    for i = 1, length do
        result[i] = string.char(math.random(97, 122)) -- ASCII 'a' to 'z'
    end
    return table.concat(result)
end

-- Student grades table
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

-- Calculate average
local average = calculateAverage(studentGrades)

-- Generate random filename
local randomName = "student_data_" .. randomString(8) .. ".lua"
print("Saving to file: " .. randomName)

-- Create and write to the random-named file
local file = io.open(randomName, "w")
if file then
    file:write("-- Student grades data\n")
    file:write("local studentGrades = {\n")
    
    for name, grade in pairs(studentGrades) do
        file:write(string.format("    [\"%s\"] = %d,\n", name, grade))
    end
    
    file:write("}\n\n")
    file:write(string.format("local average = %.2f\n\n", average))
    
    file:write("print(\"Student Grades:\")\n")
    file:write("for name, grade in pairs(studentGrades) do\n")
    file:write("    print(name .. \": \" .. grade)\n")
    file:write("end\n\n")
    
    file:write("print(\"\\nAverage Grade: \" .. average)\n\n")
    file:write("return { grades = studentGrades, average = average }\n")
    
    file:close()
    print("Data successfully saved to " .. randomName)
else
    print("Error: Could not create file " .. randomName)
end