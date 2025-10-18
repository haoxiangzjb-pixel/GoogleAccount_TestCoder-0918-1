// Rust所有权概念演示

fn main() {
    // 1. 所有权的基本概念
    println!("=== 所有权基本概念 ===");
    
    // 创建一个字符串
    let s1 = String::from("hello");
    println!("s1: {}", s1);
    
    // 将s1的所有权转移给s2（移动语义）
    let s2 = s1; // s1的所有权被转移到s2，s1不再有效
    
    // 以下代码会导致编译错误，因为s1的所有权已经被转移
    // println!("s1: {}", s1); // 这行会报错
    
    println!("s2: {}", s2);
    
    // 2. 函数中的所有权转移
    println!("\n=== 函数中的所有权转移 ===");
    
    let s3 = String::from("world");
    println!("s3在传递给函数前: {}", s3);
    
    take_ownership(s3); // s3的所有权被转移到函数中
    
    // 以下代码会导致编译错误，因为s3的所有权已经被转移
    // println!("s3在传递给函数后: {}", s3); // 这行会报错
    
    // 3. 返回值的所有权
    println!("\n=== 返回值的所有权 ===");
    
    let s4 = gives_ownership(); // gives_ownership函数返回的值的所有权被转移给s4
    println!("从函数返回的值: {}", s4);
    
    let s5 = String::from("rust");
    println!("s5在函数调用前: {}", s5);
    
    let s6 = takes_and_gives_back(s5); // s5的所有权被转移给函数，然后返回值的所有权被转移给s6
    println!("s6 (返回值): {}", s6);
    
    // 4. 借用（引用）
    println!("\n=== 借用（引用） ===");
    
    let s7 = String::from("borrowing");
    let len = calculate_length(&s7); // 使用引用，不转移所有权
    println!("字符串 '{}' 的长度是: {}", s7, len); // s7仍然有效
    
    // 5. 可变借用
    println!("\n=== 可变借用 ===");
    
    let mut s8 = String::from("hello");
    println!("修改前: {}", s8);
    change(&mut s8); // 使用可变引用
    println!("修改后: {}", s8);
    
    // 6. 借用规则演示
    println!("\n=== 借用规则 ===");
    
    let mut s9 = String::from("rules");
    
    // 可以有多个不可变引用
    let r1 = &s9;
    let r2 = &s9;
    println!("r1: {}, r2: {}", r1, r2);
    
    // 但不能同时有可变和不可变引用
    let r3 = &mut s9;
    println!("r3 (可变引用): {}", r3);
}

// 这个函数获取一个String的所有权
fn take_ownership(some_string: String) {
    println!("获得所有权的字符串: {}", some_string);
    // some_string在这里离开作用域，值被丢弃
}

// 这个函数返回一个String的所有权
fn gives_ownership() -> String {
    let some_string = String::from("from function");
    some_string // some_string的所有权被返回
}

// 这个函数接收一个String的所有权，然后返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string // 返回所有权
}

// 这个函数使用引用（借用），不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len() // s是引用，不拥有值，所以不会在离开作用域时被丢弃
}

// 这个函数修改通过可变引用传入的值
fn change(some_string: &mut String) {
    some_string.push_str(", world!");
}