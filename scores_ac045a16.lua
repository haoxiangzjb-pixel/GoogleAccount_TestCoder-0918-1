-- Lua script to store student scores and calculate average

-- Define a table to store student data
local student_data = {
    { name = "Alice", score = 92 },
    { name = "Bob", score = 85 },
    { name = "Charlie", score = 78 },
    { name = "Diana", score = 96 },
    { name = "Eve", score = 88 }
}

-- Calculate the sum of scores
local total_score = 0
for i, student in ipairs(student_data) do
    total_score = total_score + student.score
end

-- Calculate the average score
local average_score = total_score / #student_data

-- Print the table and the average
print("Student Scores:")
for i, student in ipairs(student_data) do
    print(string.format("  %s: %d", student.name, student.score))
end

print(string.format("\nAverage Score: %.2f", average_score))

-- Return the data and average if this script is required by another
return {
    data = student_data,
    average = average_score
}