// Rust 所有权概念演示

fn main() {
    // 1. 基本所有权转移示例
    println!("=== 基本所有权转移 ===");
    let s1 = String::from("hello");
    let s2 = s1;  // s1的所有权转移到s2，s1不再有效
    // println!("{}", s1);  // 这行会报错，因为s1的所有权已转移
    println!("s2: {}", s2);

    // 2. 函数中的所有权转移
    println!("\n=== 函数中的所有权转移 ===");
    let s3 = String::from("world");
    take_ownership(s3);  // s3的所有权转移到函数中
    // println!("{}", s3);  // 这行会报错，因为s3的所有权已转移
    let x = 5;
    make_copy(x);  // 基本类型实现了Copy trait，所以不会转移所有权
    println!("x is still available: {}", x);  // x仍然可用

    // 3. 返回值和作用域
    println!("\n=== 返回值和作用域 ===");
    let s4 = gives_ownership();  // 函数返回值获得所有权
    let s5 = String::from("hello");
    let s6 = takes_and_gives_back(s5);  // 转移s5所有权，并接收返回值的所有权
    println!("s4: {}, s6: {}", s4, s6);

    // 4. 引用和借用
    println!("\n=== 引用和借用 ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7);  // 传递引用，不转移所有权
    println!("The length of '{}' is {}.", s7, len);  // s7仍然有效

    // 5. 可变引用
    println!("\n=== 可变引用 ===");
    let mut s8 = String::from("hello");
    println!("Before change: {}", s8);
    change(&mut s8);  // 传递可变引用
    println!("After change: {}", s8);

    // 6. 借用规则示例
    println!("\n=== 借用规则 ===");
    let mut s9 = String::from("hello");
    let r1 = &mut s9;  // 可以有一个可变引用
    // let r2 = &mut s9;  // 这行会报错，不能同时有多个可变引用
    println!("r1: {}", r1);
    
    let r2 = &s9;  // 现在s9是不可变借用
    let r3 = &s9;  // 可以有多个不可变引用
    // let r4 = &mut s9;  // 这行会报错，不能同时有可变和不可变引用
    println!("r2: {}, r3: {}", r2, r3);
}

// 函数获取所有权
fn take_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string在此函数结束时被丢弃
}

// 函数对基本类型进行复制（Copy trait）
fn make_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer在此函数结束时被复制，原值仍然可用
}

// 函数返回值获得所有权
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string  // 返回值的所有权转移给调用者
}

// 函数接收所有权并返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string  // 返回参数的所有权给调用者
}

// 使用引用计算长度，不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len()  // s是引用，不拥有所有权，所以不会被丢弃
}

// 修改可变引用
fn change(some_string: &mut String) {
    some_string.push_str(", world");
}