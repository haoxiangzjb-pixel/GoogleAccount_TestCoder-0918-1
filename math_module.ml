(* 数学函数模块 *)
module MathFunctions = struct
  (* 基本算术运算 *)
  let add x y = x +. y
  let subtract x y = x -. y
  let multiply x y = x *. y
  let divide x y = 
    if y = 0.0 then failwith "Division by zero"
    else x /. y
  
  (* 幂运算 *)
  let power base exponent = base ** exponent
  
  (* 平方根 *)
  let sqrt x = 
    if x < 0.0 then failwith "Square root of negative number"
    else sqrt x
  
  (* 绝对值 *)
  let abs x = if x >= 0.0 then x else -. x
  
  (* 最大值和最小值 *)
  let max x y = if x > y then x else y
  let min x y = if x < y then x else y
  
  (* 三角函数 *)
  let sin x = sin x
  let cos x = cos x
  let tan x = tan x
  
  (* 对数函数 *)
  let log x = 
    if x <= 0.0 then failwith "Logarithm of non-positive number"
    else log x
  
  let log10 x = 
    if x <= 0.0 then failwith "Log10 of non-positive number"
    else log10 x
  
  (* 常数定义 *)
  let pi = 3.14159265358979323846
  let e = 2.71828182845904523536
end

(* 使用示例 *)
let () =
  Printf.printf "示例使用：\n";
  Printf.printf "2 + 3 = %f\n" (MathFunctions.add 2.0 3.0);
  Printf.printf "5 - 2 = %f\n" (MathFunctions.subtract 5.0 2.0);
  Printf.printf "4 * 3 = %f\n" (MathFunctions.multiply 4.0 3.0);
  Printf.printf "10 / 2 = %f\n" (MathFunctions.divide 10.0 2.0);
  Printf.printf "2^3 = %f\n" (MathFunctions.power 2.0 3.0);
  Printf.printf "sqrt(16) = %f\n" (MathFunctions.sqrt 16.0);
  Printf.printf "sin(pi/2) = %f\n" (MathFunctions.sin (MathFunctions.pi /. 2.0));
  Printf.printf "log(e) = %f\n" (MathFunctions.log MathFunctions.e)