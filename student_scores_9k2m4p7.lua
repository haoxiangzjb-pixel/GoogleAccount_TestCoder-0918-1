-- 学生成绩管理系统
-- 创建一个表来存储学生成绩

-- 定义学生成绩表
local studentGrades = {
    {name = "张三", score = 85},
    {name = "李四", score = 92},
    {name = "王五", score = 78},
    {name = "赵六", score = 88},
    {name = "钱七", score = 95}
}

-- 计算平均分的函数
function calculateAverage(grades)
    local total = 0
    local count = 0
    
    for i, student in ipairs(grades) do
        total = total + student.score
        count = count + 1
    end
    
    if count > 0 then
        return total / count
    else
        return 0
    end
end

-- 打印所有学生成绩
print("学生成绩列表：")
for i, student in ipairs(studentGrades) do
    print("姓名: " .. student.name .. ", 成绩: " .. student.score)
end

-- 计算并打印平均分
local average = calculateAverage(studentGrades)
print("\n平均分: " .. string.format("%.2f", average))

-- 返回学生成绩表和平均分（可选）
return {
    grades = studentGrades,
    average = average
}