fn main() {
    // 基本所有权演示
    let s1 = String::from("hello");
    let s2 = s1; // s1 的值被移动到 s2，s1 不再有效

    // println!("{}", s1); // 这一行会报错，因为 s1 已被移动
    println!("s2 is {}", s2);

    // 函数所有权演示
    let s3 = String::from("world");
    takes_ownership(s3); // s3 的所有权被移动到函数内

    // println!("{}", s3); // 这一行会报错，因为 s3 已被移动
    let x = 5;
    makes_copy(x); // x 是 Copy 类型，值被复制，x 仍然有效
    println!("x is still usable after function call: {}", x);
}

fn takes_ownership(some_string: String) {
    println!("The string in the function is: {}", some_string);
    // some_string 在这里离开作用域并被丢弃
}

fn makes_copy(some_integer: i32) {
    println!("The integer in the function is: {}", some_integer);
    // some_integer 在这里离开作用域，但因为是 Copy 类型，所以没有实际发生任何特殊事情
}