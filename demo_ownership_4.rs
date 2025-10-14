// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权的获取
    let s1 = String::from("hello"); // s1 绑定到字符串，拥有其所有权
    println!("s1: {}", s1);

    // 2. 移动语义 (Move Semantics)
    let s2 = s1; // 所有权从 s1 移动到 s2。s1 不再有效。
    // println!("s1: {}", s1); // 这一行会报错，因为 s1 已被移动
    println!("s2: {}", s2);

    // 3. 克隆 (Clone) - 创建堆上数据的深拷贝
    let s3 = s2.clone(); // s3 获得 s2 数据的副本，s2 仍然有效。
    println!("s2: {}", s2);
    println!("s3: {}", s3);

    // 4. 函数参数的所有权
    let s4 = String::from("world");
    takes_ownership(s4); // s4 的所有权被移动到函数内部
    // println!("s4: {}", s4); // 这一行会报错，因为 s4 已被移动

    // 5. 函数返回值的所有权
    let s5 = gives_ownership(); // 函数返回一个值，所有权被移动给 s5
    println!("s5: {}", s5);

    // 6. 引用和借用 (References and Borrowing)
    let len = calculate_length(&s5); // 传递 s5 的引用，不获取所有权
    println!("The length of '{}' is {}.", s5, len); // s5 仍然有效
}

// 这个函数获取字符串的所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string 在这里离开作用域，其内存被释放 (drop)
}

// 这个函数返回一个字符串，所有权被转移给调用者
fn gives_ownership() -> String {
    String::from("hello from function")
}

// 这个函数接收一个字符串的引用，不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len() // 因为 s 是一个引用，它不会获取所有权，所以不会在离开作用域时被释放
}