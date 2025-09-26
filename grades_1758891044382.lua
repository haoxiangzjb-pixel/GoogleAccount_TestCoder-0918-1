-- Lua script to store student grades and calculate average

-- Define a table to store student names and their grades
local studentGrades = {
    Alice = 85,
    Bob = 78,
    Charlie = 92,
    David = 88,
    Eve = 79
}

-- Function to calculate the average grade
local function calculateAverage(grades)
    local sum = 0
    local count = 0
    for name, grade in pairs(grades) do
        sum = sum + grade
        count = count + 1
    end
    if count == 0 then
        return 0
    else
        return sum / count
    end
end

-- Calculate the average
local average = calculateAverage(studentGrades)

-- Print the results
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", average))

-- Return the table and average for potential use by other scripts
return {
    grades = studentGrades,
    average = average
}