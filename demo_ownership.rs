// Rust 所有权演示

fn main() {
    // 1. 堆上分配的 String 类型
    let s1 = String::from("hello");

    // 2. 移动语义 (Move) - s1 的所有权被移动到 s2
    let s2 = s1; // s1 在此行后不再有效

    // println!("{}", s1); // 错误！s1 已被移动，不能再使用

    // 3. 克隆 (Clone) - 创建一个全新的堆上数据副本
    let s3 = s2.clone(); // s3 拥有 "hello" 的一个新副本

    println!("s2: {}, s3: {}", s2, s3); // 正确！s2 和 s3 都有效

    // 4. 函数调用与所有权
    takes_ownership(s3); // s3 的所有权被转移到函数内部

    // println!("{}", s3); // 错误！s3 已被移动到函数内

    // 5. 值类型 (Copy) - 栈上分配，赋值时会自动复制
    let x = 5;
    let y = x; // x 的值被复制到 y，x 依然有效

    println!("x: {}, y: {}", x, y); // 正确！x 和 y 都有效

    // 6. 返回值与所有权
    let s4 = gives_ownership(); // 函数返回的值的所有权被移动给 s4
    let s5 = String::from("world");
    let s6 = takes_and_gives_back(s5); // s5 被移动到函数内，函数返回的值的所有权移动给 s6

    println!("s4: {}, s6: {}", s4, s6);
}

// 该函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("函数内接收到: {}", some_string);
    // some_string 在此作用域结束时被丢弃 (drop)
}

// 该函数返回一个 String，所有权被转移给调用者
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // some_string 的所有权被返回给调用者
}

// 该函数接收一个所有权，并将其返回
fn takes_and_gives_back(a_string: String) -> String {
    a_string // a_string 的所有权被返回给调用者
}