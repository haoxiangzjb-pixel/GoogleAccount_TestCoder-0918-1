// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权的获取
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // 2. 移动语义 (Move Semantics)
    // 将 s1 的值移动到 s2，s1 不再有效
    let s2 = s1; // s1 的所有权被移动到 s2
    // println!("s1: {}", s1); // 这行代码会报错，因为 s1 已经被移动
    println!("s2: {}", s2);

    // 3. 克隆 (Clone) - 创建一个全新的、独立的副本
    let s3 = s2.clone();
    println!("s2 (after clone): {}", s2); // s2 仍然有效
    println!("s3 (clone of s2): {}", s3);

    // 4. 函数所有权传递
    let s4 = String::from("world");
    takes_ownership(s4); // s4 的所有权被转移到函数内部
    // println!("{}", s4); // 这行代码会报错，因为 s4 已经被移动

    // 5. 函数返回值和所有权
    let s5 = gives_ownership(); // 函数返回的值被移动到 s5
    println!("s5 (from function): {}", s5);

    let s6 = String::from("rust");
    let s7 = takes_and_gives_back(s6); // s6 被移动到函数，函数返回的值被移动到 s7
    println!("s7 (from function): {}", s7);
    // println!("s6: {}", s6); // 这行代码会报错，因为 s6 已经被移动
}

// 此函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("函数内部接收到的字符串: {}", some_string);
    // 函数结束时，some_string 离开作用域，其值被丢弃 (dropped)
}

// 此函数创建一个 String 并将其所有权返回给调用者
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // some_string 的所有权被返回
}

// 此函数获取一个所有权，然后将其返回
fn takes_and_gives_back(a_string: String) -> String {
    a_string // a_string 被返回，所有权转移回给调用者
}