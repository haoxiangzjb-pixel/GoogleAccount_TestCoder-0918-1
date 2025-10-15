// Rust Ownership Demo
// This program demonstrates the core concepts of ownership in Rust

fn main() {
    // 1. Ownership basics
    println!("=== Ownership Basics ===");
    let s1 = String::from("hello");
    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    // println!("{}", s1); // This would cause a compile error!
    println!("s2: {}", s2);

    // 2. Function ownership transfer
    println!("\n=== Function Ownership Transfer ===");
    let s3 = String::from("world");
    takes_ownership(s3); // s3 is moved into the function
    // println!("{}", s3); // This would cause a compile error!

    let x = 5;
    makes_copy(x); // x is copied (not moved) because it's an integer
    println!("x is still valid after function call: {}", x);

    // 3. Return values and scope
    println!("\n=== Return Values and Scope ===");
    let s4 = gives_ownership(); // Function gives ownership to s4
    let s5 = String::from("hello");
    let s6 = takes_and_gives_back(s5); // s5 is moved to function, s6 gets ownership
    println!("s4: {}, s6: {}", s4, s6);

    // 4. References and borrowing
    println!("\n=== References and Borrowing ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7); // &s7 creates a reference to s7
    println!("The length of '{}' is {}.", s7, len);

    // 5. Mutable references
    println!("\n=== Mutable References ===");
    let mut s8 = String::from("hello");
    println!("Before modification: {}", s8);
    change(&mut s8); // Pass a mutable reference
    println!("After modification: {}", s8);

    // 6. Multiple immutable references OR one mutable reference
    println!("\n=== Reference Rules ===");
    let s9 = String::from("hello");
    let r1 = &s9; // immutable reference
    let r2 = &s9; // immutable reference
    println!("r1: {}, r2: {} (multiple immutable references are OK)", r1, r2);

    // Uncommenting the following would cause a compile error:
    // let r3 = &mut s9; // mutable reference - would conflict with r1 and r2

    let mut s10 = String::from("hello");
    let r3 = &mut s10; // mutable reference
    // println!("s10: {}", s10); // This would cause a compile error - can't borrow s10 while r3 exists
    println!("r3 (mutable): {}", r3);
}

fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope here, but integers are copied, so nothing special happens
}

fn gives_ownership() -> String {
    let some_string = String::from("hello");
    some_string // Return ownership of the string
}

fn takes_and_gives_back(a_string: String) -> String {
    a_string // Return ownership of the received string
}

fn calculate_length(s: &String) -> usize {
    // s is a reference to a String, not the owner
    s.len() // We can use the value but not take ownership
} // s goes out of scope, but since it doesn't have ownership, nothing happens

fn change(some_string: &mut String) {
    some_string.push_str(", world!"); // Modify the string through the mutable reference
}