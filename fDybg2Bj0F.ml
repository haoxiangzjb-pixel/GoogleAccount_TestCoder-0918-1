(* 随机生成的OCaml数学模块文件 *)
module MathUtils = struct
  (* 基础数学运算 *)
  let add x y = x + y
  let sub x y = x - y
  let mul x y = x * y
  let div x y = 
    if y = 0 then 
      failwith "Division by zero"
    else 
      x / y

  (* 浮点数版本的运算 *)
  let fadd x y = x +. y
  let fsub x y = x -. y
  let fmul x y = x *. y
  let fdiv x y = 
    if y = 0.0 then 
      failwith "Division by zero"
    else 
      x /. y

  (* 幂运算 *)
  let power base exponent = base ** exponent

  (* 平方根 *)
  let sqrt x = 
    if x < 0.0 then 
      failwith "Square root of negative number"
    else 
      sqrt x

  (* 绝对值 *)
  let abs x = if x >= 0 then x else 0 - x
  let fabs x = if x >= 0.0 then x else 0.0 -. x

  (* 最大值和最小值 *)
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y

  (* 阶乘 *)
  let factorial n =
    if n < 0 then 
      failwith "Factorial of negative number"
    else
      let rec fact acc i =
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in fact 1 n

  (* 三角函数 *)
  let sin x = sin x
  let cos x = cos x
  let tan x = tan x

  (* 对数函数 *)
  let ln x = 
    if x <= 0.0 then 
      failwith "Logarithm of non-positive number"
    else 
      log x

  let log10 x = 
    if x <= 0.0 then 
      failwith "Logarithm of non-positive number"
    else 
      log10 x

  (* 常数定义 *)
  let pi = 3.14159265358979323846
  let e = 2.71828182845904523536
end

(* 辅助函数 *)
let square x = x * x
let cube x = x * x * x