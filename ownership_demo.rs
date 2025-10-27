// Rust所有权概念演示

fn main() {
    // 1. 基本所有权转移示例
    println!("=== 基本所有权转移 ===");
    let s1 = String::from("hello");
    let s2 = s1;  // s1的所有权转移到s2，s1不再有效
    // println!("{}", s1);  // 这行会报错，因为s1已经被移动
    println!("s2: {}", s2);

    // 2. 函数中的所有权转移
    println!("\n=== 函数中的所有权转移 ===");
    let s3 = String::from("world");
    take_ownership(s3);  // s3的所有权转移到函数内部
    // println!("{}", s3);  // 这行会报错，因为s3的所有权已经被转移
    let x = 5;
    make_copy(x);  // x是Copy类型，值被复制而不是移动
    println!("x is still available: {}", x);  // x仍然可用

    // 3. 返回值的所有权转移
    println!("\n=== 返回值的所有权转移 ===");
    let s4 = String::from("hello");
    let s5 = calculate_length(s4);  // s4的所有权转移到函数，然后返回的所有权给s5
    println!("s5: {}", s5);
    
    // 4. 引用和借用
    println!("\n=== 引用和借用 ===");
    let s6 = String::from("hello");
    let len = calculate_length_with_reference(&s6);  // 传递引用，不转移所有权
    println!("The length of '{}' is {}.", s6, len);  // s6仍然有效

    // 5. 可变引用
    println!("\n=== 可变引用 ===");
    let mut s7 = String::from("hello");
    println!("Before change: {}", s7);
    change(&mut s7);  // 传递可变引用
    println!("After change: {}", s7);

    // 6. 悬垂引用演示（被Rust阻止）
    println!("\n=== 悬垂引用（编译错误示例）===");
    println!("下面的代码会产生编译错误，因此被注释掉：");
    println!("// let reference_to_nothing = dangle(); // 这会产生编译错误");

    // 7. 切片演示
    println!("\n=== 字符串切片 ===");
    let s8 = String::from("hello world");
    let word = first_word(&s8);  // 使用字符串切片
    println!("The first word of '{}' is '{}'", s8, word);
}

// 函数获取所有权
fn take_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string在这里离开作用域，值被丢弃
}

// Copy类型的值被复制，不发生所有权转移
fn make_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer在这里离开作用域，但因为是Copy类型，所以没有特别操作
}

// 函数获取所有权并返回所有权
fn calculate_length(s: String) -> String {
    println!("Length of '{}' is {}", s, s.len());
    s  // 返回String，所有权转移给调用者
}

// 使用引用，不获取所有权
fn calculate_length_with_reference(s: &String) -> usize {
    s.len()  // s是引用，不拥有所有权，所以不会在离开作用域时被清理
}

// 修改可变引用
fn change(some_string: &mut String) {
    some_string.push_str(", world");
}

// 这个函数会产生编译错误，因为返回了悬垂引用
// fn dangle() -> &String {
//     let s = String::from("hello");
//     &s  // s在函数结束时离开作用域，其内存被释放，返回悬垂引用
// }

// 返回字符串切片
fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}