-- Lua script to store student scores and calculate average

-- Define a table to store student data
local student_scores = {
    { name = "Alice", score = 85 },
    { name = "Bob", score = 92 },
    { name = "Charlie", score = 78 },
    { name = "Diana", score = 96 },
    { name = "Eve", score = 88 }
}

-- Function to calculate the average score
local function calculate_average(scores_table)
    local total = 0
    local count = 0
    for i, student in ipairs(scores_table) do
        total = total + student.score
        count = count + 1
    end
    if count == 0 then
        return 0
    else
        return total / count
    end
end

-- Calculate the average
local average_score = calculate_average(student_scores)

-- Print the results
print("Student Scores:")
for i, student in ipairs(student_scores) do
    print("  " .. student.name .. ": " .. student.score)
end
print("\nAverage Score: " .. average_score)

-- Return the table and average for potential further use if this script is required by another
return {
    scores = student_scores,
    average = average_score
}