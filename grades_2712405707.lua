-- Lua script to store student grades and calculate average

-- Define a table to store student names and their grades
local studentGrades = {
    Alice = 92,
    Bob = 85,
    Charlie = 78,
    Diana = 96,
    Edward = 88
}

-- Calculate the sum of grades
local sum = 0
local count = 0
for name, grade in pairs(studentGrades) do
    sum = sum + grade
    count = count + 1
end

-- Calculate the average
local average = sum / count

-- Print the results
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end
print("Average Grade: " .. average)

-- Return the table and average for potential external use
return {
    grades = studentGrades,
    average = average
}