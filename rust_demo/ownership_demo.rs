fn main() {
    // 1. 栈上的数据拷贝
    let x = 5;
    let y = x; // i32 实现了 Copy trait，这里发生了拷贝
    println!("x = {}, y = {}", x, y); // x 和 y 都可以继续使用

    // 2. 堆上的数据移动 (Move)
    let s1 = String::from("hello");
    let s2 = s1; // String 没有实现 Copy，这里发生了移动
    // println!("{}", s1); // 这行代码会编译错误，因为 s1 的所有权已经转移给了 s2
    println!("s2 = {}", s2); // 只有 s2 可以使用

    // 3. 克隆 (Clone)
    let s3 = String::from("world");
    let s4 = s3.clone(); // 显式克隆，会在堆上创建一份数据的副本
    println!("s3 = {}, s4 = {}", s3, s4); // s3 和 s4 都可以使用

    // 4. 函数传参和返回值中的所有权
    let s5 = String::from("rust");
    takes_ownership(s5); // s5 的所有权被移动到函数内部，此后 s5 不再有效
    // println!("{}", s5); // 这行代码会编译错误

    let x = 10;
    makes_copy(x); // i32 是 Copy 的，所以这里是拷贝，x 依然可以使用
    println!("x is still usable: {}", x);

    let s6 = gives_ownership(); // s6 获得了函数返回值的所有权
    println!("s6: {}", s6);

    let s7 = String::from("take_and_give_back");
    let s8 = takes_and_gives_back(s7); // s7 的所有权移动到函数，然后函数返回值的所有权移动到 s8
    // s7 不再有效
    println!("s8: {}", s8);
}

fn takes_ownership(some_string: String) {
    println!("Inside function, received: {}", some_string);
    // some_string 在这里离开作用域，调用 drop 方法，其堆上的内存被释放
}

fn makes_copy(some_integer: i32) {
    println!("Inside function, received: {}", some_integer);
    // some_integer 在这里离开作用域，因为它在栈上，所以无需特殊操作
}

fn gives_ownership() -> String {
    let some_string = String::from("I'm owned by the caller now");
    some_string // 返回值的所有权被移动给函数的调用者
}

fn takes_and_gives_back(a_string: String) -> String {
    a_string // 参数的所有权被移动进来，然后又被移动出去
}