import macros, random, strutils, os

# 定义一个宏，用于生成重复代码
macro generateRepeatedCode(count: static[int], code: untyped): untyped =
  ## 生成重复的代码块
  result = newStmtList()
  for i in 0..<count:
    let repeatedStmt = code.copy()
    result.add(repeatedStmt)

# 使用宏生成重复代码的示例
proc exampleUsage() =
  echo "使用宏生成重复代码的示例："
  
  # 生成10次相同的打印语句
  generateRepeatedCode(5):
    echo "这是重复的代码行"
  
  # 生成3次变量赋值
  var counter = 0
  generateRepeatedCode(3):
    counter += 1
    echo "计数器值: ", counter

# 生成随机命名的.nim文件的函数
proc generateRandomNimFile() =
  # 生成随机文件名
  randomize()
  let randomName = "generated_code_" & $rand(100000) & ".nim"
  
  # 创建重复代码的字符串表示
  var generatedCode = "import std/[strutils, math]\n\n"
  generatedCode.add "# 这是一个由宏生成的重复代码文件\n\n"
  
  # 添加重复的函数定义
  for i in 1..5:
    generatedCode.add("proc generatedFunction" & $i & "(): string =\n")
    generatedCode.add("  result = \"Generated function " & $i & " called\"\n\n")
  
  # 添加重复的变量声明
  for i in 1..3:
    generatedCode.add("let generatedVar" & $i & " = \"Variable " & $i & " value\"\n")
  
  generatedCode.add("\nproc main() =\n")
  for i in 1..5:
    generatedCode.add("  echo generatedFunction" & $i & "()\n")
  for i in 1..3:
    generatedCode.add("  echo generatedVar" & $i & "\n")
  
  generatedCode.add("\nmain()\n")
  
  # 写入文件
  writeFile(randomName, generatedCode)
  echo "已生成文件: ", randomName

# 主程序
when isMainModule:
  exampleUsage()
  echo "\n生成随机命名的.nim文件："
  generateRandomNimFile()