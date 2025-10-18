// Rust 所有权概念演示

fn main() {
    // 1. 所有权基础 - 变量绑定
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // 2. 移动语义 - 当将s1赋值给s2时，s1的所有权被移动到s2
    let s2 = s1;  // s1的所有权被移动到s2，s1现在无效
    // println!("s1: {}", s1);  // 这行会报错，因为s1不再有效
    println!("s2: {}", s2);

    // 3. 克隆 - 创建数据的深拷贝
    let s3 = String::from("world");
    let s4 = s3.clone();  // 创建s3的深拷贝
    println!("s3: {}, s4: {}", s3, s4);  // 两者都有效

    // 4. 函数参数的所有权
    let s5 = String::from("ownership");
    takes_ownership(s5);  // s5的所有权被转移到函数中
    // println!("{}", s5);  // 这行会报错，因为s5的所有权已经被转移

    let x = 5;
    makes_copy(x);  // 对于Copy类型，会发生拷贝而不是移动
    println!("x is still available: {}", x);  // x仍然有效

    // 5. 函数返回值的所有权
    let s6 = gives_ownership();  // 函数返回值的所有权被转移给s6
    println!("s6: {}", s6);

    let s7 = String::from("returned");
    let s8 = takes_and_gives_back(s7);  // s7的所有权被转移，然后函数返回新值的所有权
    println!("s8: {}", s8);

    // 6. 引用和借用
    let s9 = String::from("hello");
    let len = calculate_length(&s9);  // 传递s9的引用，不转移所有权
    println!("The length of '{}' is {}.", s9, len);  // s9仍然有效

    // 7. 可变引用
    let mut s10 = String::from("hello");
    println!("Before change: {}", s10);
    change(&mut s10);  // 传递可变引用
    println!("After change: {}", s10);

    // 8. 悬垂引用（Dangling reference）- Rust会防止这种情况
    // let reference_to_nothing = dangle();  // 这个函数不能编译，因为它试图返回一个悬垂引用
    let no_dangle_result = no_dangle();
    println!("No dangle result: {}", no_dangle_result);
}

// 函数获取所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string在这里离开作用域，值被丢弃
}

// 函数接收Copy类型的值（不会转移所有权）
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer在这里离开作用域，但因为i32实现了Copy，所以只是拷贝
}

// 函数返回所有权
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string  // 返回值的所有权被转移给调用者
}

// 函数接收并返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string  // 返回参数的所有权给调用者
}

// 计算字符串长度的函数，使用引用（借用）
fn calculate_length(s: &String) -> usize {
    s.len()  // 通过引用访问s，不获得所有权
}  // s是引用，所以不会释放任何内容

// 修改字符串的函数，使用可变引用
fn change(some_string: &mut String) {
    some_string.push_str(", world");
}

// 尝试返回悬垂引用 - 这个函数不会编译
// fn dangle() -> &String {
//     let s = String::from("hello");
//     &s  // s将在函数结束时离开作用域，返回的引用将指向被释放的内存
// }

// 正确的版本 - 返回所有权而不是引用
fn no_dangle() -> String {
    let s = String::from("hello");
    s  // 返回String的所有权，而不是引用
}