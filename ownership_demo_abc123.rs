// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权的转移
    let s1 = String::from("hello");
    println!("s1: {}", s1); // s1 拥有字符串 "hello"

    // let s2 = s1; // 将 s1 的所有权转移给 s2
    // println!("s1: {}", s1); // 错误！s1 不再有效，因为所有权已转移
    // println!("s2: {}", s2); // 正确！s2 现在拥有字符串 "hello"

    // 2. 函数调用中的所有权转移
    let s3 = String::from("world");
    println!("s3 before function call: {}", s3);
    takes_ownership(s3); // s3 的所有权被转移到函数内部
    // println!("s3 after function call: {}", s3); // 错误！s3 不再有效

    // 3. 返回值和所有权
    let s4 = gives_ownership(); // 函数返回一个值，所有权被转移给 s4
    println!("s4 after function call: {}", s4);

    let s5 = String::from("rust");
    println!("s5 before function call: {}", s5);
    let s6 = takes_and_gives_back(s5); // s5 被移动到函数中，然后所有权通过返回值移回给 s6
    println!("s6 after function call: {}", s6);
    // println!("s5 after function call: {}", s5); // 错误！s5 不再有效
}

// 这个函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("The string in takes_ownership is: {}", some_string);
    // some_string 在这里超出作用域，其内存被释放
}

// 这个函数创建一个 String 并返回其所有权
fn gives_ownership() -> String {
    let some_string = String::from("from function");
    some_string // 将 some_string 的所有权返回给调用者
}

// 这个函数获取一个 String 的所有权，然后将其返回
fn takes_and_gives_back(a_string: String) -> String {
    a_string // 将 a_string 的所有权返回给调用者
}