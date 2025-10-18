(* OCaml模块：封装数学函数 *)
module MathUtils = struct

  (* 加法 *)
  let add x y = x + y

  (* 减法 *)
  let sub x y = x - y

  (* 乘法 *)
  let mul x y = x * y

  (* 除法 *)
  let div x y = 
    if y = 0 then 
      failwith "Division by zero"
    else 
      x / y

  (* 求幂 *)
  let power base exp =
    let rec pow acc n =
      if n <= 0 then acc
      else pow (acc * base) (n - 1)
    in
    pow 1 exp

  (* 绝对值 *)
  let abs x = if x < 0 then -x else x

  (* 最大值 *)
  let max x y = if x > y then x else y

  (* 最小值 *)
  let min x y = if x < y then x else y

  (* 阶乘 *)
  let factorial n =
    let rec fact acc i =
      if i <= 1 then acc
      else fact (acc * i) (i - 1)
    in
    if n < 0 then failwith "Factorial of negative number"
    else fact 1 n

  (* 判断是否为质数 *)
  let is_prime n =
    let rec check_divisor i =
      if i * i > n then true
      else if n mod i = 0 then false
      else check_divisor (i + 1)
    in
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else check_divisor 3

  (* 计算平方根（牛顿法）*)
  let sqrt x =
    let rec improve_guess guess =
      let new_guess = (guess +. x /. guess) /. 2.0 in
      if abs_float (new_guess -. guess) < 0.0001 then new_guess
      else improve_guess new_guess
    in
    if x < 0.0 then failwith "Square root of negative number"
    else if x = 0.0 then 0.0
    else improve_guess 1.0

  (* 计算圆的面积 *)
  let circle_area radius = 
    let pi = 3.141592653589793238 in
    pi *. radius *. radius

  (* 计算圆的周长 *)
  let circle_circumference radius =
    let pi = 3.141592653589793238 in
    2.0 *. pi *. radius

end

(* 使用示例 *)
let () =
  print_endline "OCaml MathUtils 模块示例：";
  print_int (MathUtils.add 5 3); print_endline "";
  print_int (MathUtils.factorial 5); print_endline "";
  print_endline (string_of_bool (MathUtils.is_prime 17));
  print_float (MathUtils.sqrt 16.0); print_endline ""