fn main() {
    // 1. 栈上的数据拷贝 (Copy)
    let x = 5;
    let y = x; // i32 实现了 Copy trait，这里是拷贝
    println!("x = {}, y = {}", x, y); // x 仍然可以使用

    // 2. 堆上的数据移动 (Move)
    let s1 = String::from("hello");
    let s2 = s1; // String 没有实现 Copy，这里是移动
    // println!("{}", s1); // 这行代码会编译错误，因为 s1 的所有权已经移出
    println!("s2 = {}", s2); // s2 现在拥有所有权

    // 3. 克隆 (Clone)
    let s3 = String::from("world");
    let s4 = s3.clone(); // 显式克隆，会在堆上创建一份数据的副本
    println!("s3 = {}, s4 = {}", s3, s4); // s3 和 s4 都可以使用

    // 4. 函数调用与所有权转移
    let s5 = String::from("ownership");
    takes_ownership(s5); // s5 的所有权被移动到函数内部
    // println!("{}", s5); // 这行代码会编译错误

    // 5. 函数返回值与所有权转移
    let s6 = gives_ownership(); // s6 获得了返回值的所有权
    println!("s6 = {}", s6);

    // 6. 引用 (References) 和借用 (Borrowing)
    let s7 = String::from("borrowing");
    let len = calculate_length(&s7); // 传递引用，不转移所有权
    println!("The length of '{}' is {}.", s7, len); // s7 仍然可以使用

    // 7. 可变引用 (Mutable References)
    let mut s8 = String::from("hello");
    change(&mut s8); // 传递可变引用
    println!("s8 = {}", s8); // s8 的值已被修改
}

fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string 在这里离开作用域并被丢弃 (drop)
}

fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // 返回值，将所有权移给调用者
}

fn calculate_length(s: &String) -> usize { // s 是一个对 String 的引用
    s.len()
    // s 在这里离开作用域，但它不拥有引用值的所有权，所以什么都不会发生
}

fn change(s: &mut String) { // s 是一个对 String 的可变引用
    s.push_str(", world!");
    // 通过可变引用修改了原始数据
}