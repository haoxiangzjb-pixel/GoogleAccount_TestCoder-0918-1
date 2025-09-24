// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权
    let s1 = String::from("hello");
    println!("s1: {}", s1); // s1 拥有字符串 "hello"

    // 2. 移动语义 (Move)
    let s2 = s1; // s1 的所有权被移动到 s2
    // println!("s1: {}", s1); // 这行代码会报错，因为 s1 不再有效
    println!("s2: {}", s2);

    // 3. 克隆 (Clone) - 深拷贝
    let s3 = s2.clone(); // 创建 s2 的一个完整拷贝
    println!("s2: {}, s3: {}", s2, s3); // s2 和 s3 都有效

    // 4. 函数传参和所有权
    let s4 = String::from("world");
    takes_ownership(s4); // s4 的所有权被移动到函数内部
    // println!("{}", s4); // 这行代码会报错

    let x = 5; // i32 是 Copy 类型
    makes_copy(x); // x 被复制（而不是移动）到函数内部
    println!("x is still valid: {}", x); // x 仍然有效

    // 5. 函数返回和所有权
    let s5 = gives_ownership(); // 函数返回的值的所有权被移动给 s5
    println!("s5: {}", s5);
    let s6 = String::from("rust");
    let s7 = takes_and_gives_back(s6); // s6 的所有权被移入函数，然后所有权又被移出返回给 s7
    // println!("{}", s6); // 这行代码会报错
    println!("s7: {}", s7);
}

// 这个函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string 在这里离开作用域，`drop` 函数被调用，内存被释放
}

// 这个函数获取一个 Copy 类型的值
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer 在这里离开作用域，但因为是 Copy 类型，所以没有特殊操作
}

// 这个函数返回一个 String，所有权被移出
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // some_string 的所有权被返回
}

// 这个函数接收一个 String，然后返回它的所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string // a_string 被返回，所有权被移出
}