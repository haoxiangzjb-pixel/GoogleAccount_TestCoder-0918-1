-- Lua script to store student grades in a table and calculate average
math.randomseed(os.time())

-- Create a table to store student grades
local student_grades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88
}

-- Function to calculate average grade
function calculate_average(grades)
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

-- Calculate the average
local average_grade = calculate_average(student_grades)

-- Print the grades and average
print("Student Grades:")
for name, grade in pairs(student_grades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", average_grade))

-- Generate a random filename
local random_name = "student_grades_" .. math.random(10000, 99999) .. ".lua"

-- Write the table and average to the random-named file
local file = io.open(random_name, "w")
if file then
    file:write("-- Student grades table and average\n")
    file:write("local student_grades = {\n")
    for name, grade in pairs(student_grades) do
        file:write("    [\"" .. name .. "\"] = " .. grade .. ",\n")
    end
    file:write("}\n\n")
    file:write("local average_grade = " .. average_grade .. "\n\n")
    file:write("return {grades = student_grades, average = average_grade}\n")
    file:close()
    
    print("\nData saved to: " .. random_name)
else
    print("Error: Could not create file " .. random_name)
end