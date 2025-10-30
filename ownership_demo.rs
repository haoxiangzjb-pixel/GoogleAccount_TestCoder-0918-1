// Rust所有权概念演示

fn main() {
    // 1. 基本的所有权转移
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
    make_copy(x);  // 对于Copy类型的值，会进行复制而不是移动
    println!("x is still available: {}", x);  // x仍然可用

    // 3. 返回值的所有权转移
    println!("\n=== 返回值的所有权转移 ===");
    let s4 = give_ownership();
    println!("Received ownership of: {}", s4);
    
    let s5 = String::from("hello again");
    let s6 = take_and_give_back(s5);  // s5的所有权转移到函数，然后返回给s6
    println!("Received ownership of: {}", s6);

    // 4. 引用和借用
    println!("\n=== 引用和借用 ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7);  // 传递s7的引用，不转移所有权
    println!("The length of '{}' is {}.", s7, len);

    // 5. 可变引用
    println!("\n=== 可变引用 ===");
    let mut s8 = String::from("hello");
    println!("Before modification: {}", s8);
    change(&mut s8);  // 传递可变引用
    println!("After modification: {}", s8);

    // 6. 悬垂引用示例（注释掉，因为这会导致编译错误）
    // println!("\n=== 悬垂引用（演示错误） ===");
    // let reference_to_nothing = dangle();  // 这会导致编译错误
}

// 函数获取所有权
fn take_ownership(some_string: String) {
    println!("Took ownership and will print: {}", some_string);
    // some_string在这里离开作用域，值被丢弃
}

// 函数对Copy类型的值进行复制
fn make_copy(some_integer: i32) {
    println!("Made a copy and will print: {}", some_integer);
    // some_integer在这里离开作用域，但因为i32实现了Copy，所以不会被移动
}

// 函数返回所有权
fn give_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string  // 返回值的所有权被转移给调用者
}

// 函数接收并返回所有权
fn take_and_give_back(a_string: String) -> String {
    a_string  // 返回所有权给调用者
}

// 使用引用（借用）计算长度，不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len()  // s是引用，不拥有所有权，所以不会在离开作用域时被清理
}

// 使用可变引用修改字符串
fn change(some_string: &mut String) {
    some_string.push_str(", world!");
}

// 这个函数会导致编译错误，因为它试图返回一个悬垂引用
// fn dangle() -> &String {
//     let s = String::from("hello");
//     &s  // s离开作用域，其值被丢弃，返回悬垂引用
// }
// 正确的做法是返回所有权
fn no_dangle() -> String {
    let s = String::from("hello");
    s  // 返回所有权而不是引用
}