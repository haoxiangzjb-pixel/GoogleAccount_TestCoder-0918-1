// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权的获得
    let s1 = String::from("hello"); // s1 绑定到字符串，获得所有权
    println!("s1: {}", s1);

    // 2. 移动语义 (Move Semantics)
    // 将 s1 的值移动给 s2，s1 将不再有效
    let s2 = s1; // 此处发生了移动 (move)，s1 的所有权被转移给 s2
    // println!("s1: {}", s1); // 如果取消注释，这行代码会报错！因为 s1 不再拥有数据
    println!("s2: {}", s2);

    // 3. 函数传参和所有权转移
    let s3 = String::from("world");
    takes_ownership(s3); // s3 的所有权被转移进函数
    // println!("{}", s3); // 如果取消注释，这行代码会报错！因为 s3 不再拥有数据

    // 4. 函数返回和所有权转移
    let s4 = gives_ownership(); // 函数返回的值的所有权被转移给 s4
    println!("s4 (from function): {}", s4);

    // 5. 引用和借用 (References and Borrowing) - 避免所有权转移
    let len = calculate_length(&s4); // 传递 s4 的引用，不转移所有权
    println!("The length of '{}' is {}.", s4, len); // s4 仍然有效，因为没有转移所有权
}

// 该函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // 函数结束时，some_string 离开作用域，其值被丢弃 (dropped)
}

// 该函数返回一个 String，所有权转移给调用者
fn gives_ownership() -> String {
    String::from("hello from function")
    // 这个新创建的 String 的所有权被返回给调用者
}

// 该函数获取一个字符串的引用，不获取所有权
fn calculate_length(s: &String) -> usize { // s 是一个引用
    s.len() // 因为没有获取所有权，所以可以安全地返回一个值
    // s 离开作用域，但它不拥有引用的数据，所以不会发生任何事情
}