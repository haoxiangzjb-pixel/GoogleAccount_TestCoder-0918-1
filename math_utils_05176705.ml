(* OCaml模块：封装数学函数 *)
module Math = struct
  (* 计算平方 *)
  let square x = x *. x

  (* 计算立方 *)
  let cube x = x *. x *. x

  (* 计算绝对值 *)
  let abs x = if x >= 0.0 then x else -.x

  (* 计算两数的最大值 *)
  let max x y = if x >= y then x else y

  (* 计算两数的最小值 *)
  let min x y = if x <= y then x else y

  (* 计算幂次方 *)
  let power base exponent = base ** exponent

  (* 计算阶乘 *)
  let factorial n =
    let rec aux acc i =
      if i <= 1 then acc
      else aux (acc * i) (i - 1)
    in
    aux 1 n

  (* 计算两点之间的距离 *)
  let distance x1 y1 x2 y2 = 
    sqrt (((x2 -. x1) ** 2.0) +. ((y2 -. y1) ** 2.0))

  (* 判断一个数是否为质数 *)
  let is_prime n =
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else
      let rec check_divisor i =
        if i * i > n then true
        else if n mod i = 0 then false
        else check_divisor (i + 2)
      in
      check_divisor 3
end

(* 使用示例 *)
let () =
  print_endline "Math module loaded successfully!";
  print_endline (string_of_float (Math.square 5.0));
  print_endline (string_of_float (Math.power 2.0 3.0));
  print_endline (string_of_int (Math.factorial 5));
  print_endline (string_of_float (Math.distance 0.0 0.0 3.0 4.0));
  print_endline (string_of_bool (Math.is_prime 17))