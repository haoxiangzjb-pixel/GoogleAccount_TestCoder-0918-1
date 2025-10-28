(* 随机生成的OCaml数学模块文件 - 扩展版 *)
module AdvancedMath = struct
  (* 基础算术运算 *)
  let (+) x y = x + y
  let (-) x y = x - y
  let ( * ) x y = x * y
  let (/) x y = 
    if y = 0 then 
      failwith "Division by zero"
    else 
      x / y

  (* 浮点运算 *)
  let (+.) x y = x +. y
  let (-.) x y = x -. y
  let ( *. ) x y = x *. y
  let (/.) x y = 
    if y = 0.0 then 
      failwith "Division by zero"
    else 
      x /. y

  (* 幂和指数运算 *)
  let pow base exponent = base ** exponent
  let square x = x *. x
  let cube x = x *. x *. x
  let exp x = exp x

  (* 根式运算 *)
  let sqrt x = 
    if x < 0.0 then 
      failwith "Square root of negative number"
    else 
      sqrt x
  let cbrt x = 
    if x >= 0.0 then 
      x ** (1.0 /. 3.0)
    else 
      ~-.(abs_float x ** (1.0 /. 3.0))

  (* 三角函数 *)
  let sin x = sin x
  let cos x = cos x
  let tan x = tan x
  let asin x = asin x
  let acos x = acos x
  let atan x = atan x
  let atan2 y x = atan2 y x

  (* 双曲函数 *)
  let sinh x = sinh x
  let cosh x = cosh x
  let tanh x = tanh x

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
  let log_base base x = ln x /. ln base

  (* 取整函数 *)
  let floor x = floor x
  let ceil x = ceil x
  let round x = 
    if x >= 0.0 then 
      floor (x +. 0.5) 
    else 
      ceil (x -. 0.5)

  (* 绝对值和符号 *)
  let abs x = abs_float x
  let sign x = 
    if x > 0.0 then 1.0 
    else if x < 0.0 then -1.0 
    else 0.0

  (* 最大值和最小值 *)
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y

  (* 阶乘和组合 *)
  let factorial n =
    if n < 0 then 
      failwith "Factorial of negative number"
    else
      let rec fact acc i =
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in fact 1 n

  let combination n k =
    if n < 0 || k < 0 || k > n then
      failwith "Invalid parameters for combination"
    else
      let rec comb acc i j =
        if j = 0 then acc
        else comb ((acc * (i - j + 1)) / j) i (j - 1)
      in comb 1 n k

  let permutation n k =
    if n < 0 || k < 0 || k > n then
      failwith "Invalid parameters for permutation"
    else
      let rec perm acc i j =
        if j = 0 then acc
        else perm (acc * (i - j + 1)) i (j - 1)
      in perm 1 n k

  (* 常数定义 *)
  let pi = 3.14159265358979323846
  let e = 2.71828182845904523536
  let phi = (1.0 +. sqrt 5.0) /. 2.0  (* 黄金比例 *)
end

(* 模块级辅助函数 *)
let gcd a b =
  let rec gcd_aux a b =
    if b = 0 then abs a
    else gcd_aux b (a mod b)
  in gcd_aux (abs a) (abs b)

let lcm a b = 
  if a = 0 || b = 0 then 0
  else abs (a * b) / (gcd a b)

(* 数列函数 *)
let fibonacci n =
  if n < 0 then 
    failwith "Fibonacci of negative number"
  else
    let rec fib a b i =
      if i = 0 then a
      else fib b (a + b) (i - 1)
    in fib 0 1 n