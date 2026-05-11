# Nim宏示例：生成重复代码

macro repeatCode(n: static[int], body: untyped): untyped =
  ## 一个宏，用于重复执行代码块n次
  result = newStmtList()
  for i in 0..<n:
    result.add(body)

# 使用宏生成重复代码
repeatCode(5):
  echo "这是第 ", i + 1, " 次重复"

# 另一个宏示例：生成多个类似的过程
macro genProcs(names: varargs[untyped]): untyped =
  ## 为每个给定的名称生成一个过程
  result = newStmtList()
  for name in names:
    let procName = ident($name)
    let procBody = quote do:
      proc `procName`(x: int): int =
        return x * 2
    result.add(procBody)

# 使用宏生成多个过程
genProcs(doubleA, doubleB, doubleC)

# 测试生成的过程
echo "doubleA(5) = ", doubleA(5)
echo "doubleB(10) = ", doubleB(10)
echo "doubleC(15) = ", doubleC(15)
