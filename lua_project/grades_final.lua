-- 学生成绩表
local student_grades = {
    ["Alice"] = { math = 95, english = 87, science = 92 },
    ["Bob"] = { math = 78, english = 85, science = 80 },
    ["Charlie"] = { math = 90, english = 91, science = 88 },
    ["David"] = { math = 85, english = 79, science = 84 },
    ["Eva"] = { math = 92, english = 94, science = 96 }
}

-- 计算单个学生的平均分
local function calculate_average(grades)
    local sum = 0
    local count = 0
    for _, grade in pairs(grades) do
        sum = sum + grade
        count = count + 1
    end
    return sum / count
end

-- 为每个学生计算并打印平均分
for student, grades in pairs(student_grades) do
    local avg = calculate_average(grades)
    print(student .. "'s average grade: " .. string.format("%.2f", avg))
end