fn main() {
    // --- 基本所有权示例 ---
    println!("--- 基本所有权示例 ---");
    {
        let s1 = String::from("hello"); // s1 获得所有权
        println!("s1: {}", s1);

        let s2 = s1; // 所有权从 s1 移动到 s2，s1 不再有效
        // println!("s1: {}", s1); // 这一行会报错，因为 s1 已被移动
        println!("s2: {}", s2);
    } // s2 在这里离开作用域并被丢弃

    // --- 函数中的所有权 ---
    println!("\n--- 函数中的所有权 ---");
    {
        let s3 = String::from("world");
        let len = calculate_length(s3); // s3 的所有权被移动到函数内
        // println!("s3: {}", s3); // 这里 s3 不再有效
        println!("The length of the string is {}.", len);
    }

    // --- 引用和借用 ---
    println!("\n--- 引用和借用 ---");
    {
        let s4 = String::from("hello, world");
        let len = calculate_length_with_ref(&s4); // 传递 s4 的引用，不转移所有权
        println!("The length of '{}' is {}.", s4, len); // s4 仍然有效

        // 可变引用示例
        let mut s5 = String::from("hi");
        println!("Before change: {}", s5);
        change_string(&mut s5); // 传递可变引用
        println!("After change: {}", s5);
    }
}

// 函数获取所有权
fn calculate_length(s: String) -> usize {
    s.len()
} // s 在这里离开作用域并被丢弃

// 函数借用（不获取所有权）
fn calculate_length_with_ref(s: &String) -> usize { // s 是一个引用
    s.len()
} // s 离开作用域，但它引用的值不在此处被丢弃

// 修改可变引用
fn change_string(s: &mut String) {
    s.push_str(", Rust!");
}