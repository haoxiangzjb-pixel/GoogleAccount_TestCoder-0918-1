-- Lua表存储学生成绩
local student_grades = {
    {name = "张三", score = 85},
    {name = "李四", score = 92},
    {name = "王五", score = 78},
    {name = "赵六", score = 96},
    {name = "孙七", score = 88}
}

-- 计算平均分
local total_score = 0
local student_count = #student_grades

for i, student in ipairs(student_grades) do
    total_score = total_score + student.score
end

local average_score = total_score / student_count

-- 输出结果
print("学生成绩列表：")
for i, student in ipairs(student_grades) do
    print(i .. ". " .. student.name .. ": " .. student.score .. "分")
end

print("\n总分: " .. total_score)
print("学生人数: " .. student_count)
print("平均分: " .. string.format("%.2f", average_score) .. "分")

-- 返回数据用于其他用途
return {
    students = student_grades,
    average = average_score,
    total = total_score,
    count = student_count
}
