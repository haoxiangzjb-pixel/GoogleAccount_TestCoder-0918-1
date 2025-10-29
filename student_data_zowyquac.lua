-- Student grades data
local studentGrades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88,
}

local average = 87.80

print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. average)

return { grades = studentGrades, average = average }
