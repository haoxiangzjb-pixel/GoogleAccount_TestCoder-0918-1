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

-- Calculate average
local average = calculateAverage(studentGrades)

-- Print the results
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", average))

-- Return the table and average for use in other scripts
return {
    grades = studentGrades,
    average = average
}