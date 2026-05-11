# Nim 宏示例：生成重复代码

import macros

# 宏：repeatCode
# 用法：repeatCode(N, body)
# 将 body 代码块重复 N 次展开
macro repeatCode(count: static[int], body: untyped): untyped =
  result = newStmtList()
  for i in 0..<count:
    result.add(body)

# 宏：genProcs
# 用法：genProcs(Prefix, Start, End)
# 生成名为 Prefix1, Prefix2, ..., PrefixN 的过程
macro genProcs(prefix: untyped, startIdx, endIdx: static[int]): untyped =
  result = newStmtList()
  for i in startIdx..endIdx:
    let procName = ident($prefix & $i)
    let procDef = quote do:
      proc `procName`(x: int): int =
        return x * `i`
    result.add(procDef)

# 使用示例
when isMainModule:
  echo "=== repeatCode 示例 ==="
  var sum = 0
  repeatCode(5, block:
    inc(sum)
    echo "当前 sum = ", sum)
  
  echo "\n=== genProcs 示例 ==="
  genProcs(mul, 1, 3)
  echo "mul1(4) = ", mul1(4)
  echo "mul2(4) = ", mul2(4)
  echo "mul3(4) = ", mul3(4)
