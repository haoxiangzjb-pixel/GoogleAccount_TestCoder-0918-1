-- Lua script to store student grades and calculate average

-- Define a table to store student data
local students = {
    { name = "Alice", grade = 85 },
    { name = "Bob", grade = 92 },
    { name = "Charlie", grade = 78 },
    { name = "Diana", grade = 96 },
    { name = "Eve", grade = 88 }
}

-- Function to calculate the average grade
local function calculate_average(stu_table)
    local sum = 0
    for i, student in ipairs(stu_table) do
        sum = sum + student.grade
    end
    return sum / #stu_table
end

-- Calculate and print the average
local average_grade = calculate_average(students)
print("Student Grades:")
for i, student in ipairs(students) do
    print("  " .. student.name .. ": " .. student.grade)
end
print("Average Grade: " .. average_grade)

-- Return the data and function if this script is required by another
return {
    students = students,
    average = average_grade
}