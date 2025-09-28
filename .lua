-- Lua script to store student scores and calculate average

-- Table to store student data
local student_scores = {
    { name = "Alice", score = 95 },
    { name = "Bob", score = 87 },
    { name = 90, name = "Charlie" }, -- Intentional misordering to demonstrate flexibility, though not ideal
    { name = "David", score = 78 },
    { name = "Eve", score = 92 }
}

-- Correct the misordered entry for Charlie
student_scores[3] = { name = "Charlie", score = 90 }

-- Function to calculate average score
local function calculate_average(scores_table)
    local total = 0
    local count = 0
    for i, student in ipairs(scores_table) do
        if student.score then
            total = total + student.score
            count = count + 1
        end
    end
    if count == 0 then
        return 0 -- Avoid division by zero
    end
    return total / count
end

-- Calculate the average
local average_score = calculate_average(student_scores)

-- Print results
print("Student Scores:")
for i, student in ipairs(student_scores) do
    print("  " .. student.name .. ": " .. student.score)
end

print("\nAverage Score: " .. average_score)

-- Return the table and average for potential external use
return {
    scores = student_scores,
    average = average_score
}