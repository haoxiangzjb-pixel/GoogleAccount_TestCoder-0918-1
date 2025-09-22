-- Student Grades Management in Lua

-- Create a table to store student records
students = {}

-- Function to add a student
function addStudent(name, grades)
    table.insert(students, {name = name, grades = grades})
end

-- Function to calculate the average of a list of grades
function calculateAverage(grades)
    if #grades == 0 then
        return 0
    end
    local sum = 0
    for i, grade in ipairs(grades) do
        sum = sum + grade
    end
    return sum / #grades
end

-- Add sample students
addStudent("Alice", {85, 92, 78, 96})
addStudent("Bob", {70, 88, 82})
addStudent("Charlie", {95, 90, 93, 89, 91})

-- Calculate and print averages
print("Student Grade Averages:")
for i, student in ipairs(students) do
    local avg = calculateAverage(student.grades)
    print(student.name .. ": " .. string.format("%.2f", avg))
end