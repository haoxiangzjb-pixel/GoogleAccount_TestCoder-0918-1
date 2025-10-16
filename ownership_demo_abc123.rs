// Rust Ownership Demo
// This program demonstrates the key concepts of ownership in Rust

fn main() {
    // 1. Ownership basics
    println!("=== Ownership Basics ===");
    let s1 = String::from("hello");
    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    // println!("{}", s1); // This would cause a compile error!
    println!("s2: {}", s2);

    // 2. Functions and ownership
    println!("\n=== Functions and Ownership ===");
    let s3 = String::from("world");
    takes_ownership(s3); // s3 is moved into the function
    // println!("{}", s3); // This would cause a compile error!

    let x = 5;
    makes_copy(x); // x is copied (not moved) because it's an integer
    println!("x is still valid after function call: {}", x);

    // 3. Return values and ownership
    println!("\n=== Return Values and Ownership ===");
    let s4 = gives_ownership(); // Function returns ownership
    let s5 = String::from("hello");
    let s6 = takes_and_gives_back(s5); // Function takes and returns ownership
    println!("s4: {}, s6: {}", s4, s6);

    // 4. References and borrowing
    println!("\n=== References and Borrowing ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7); // Pass reference, no ownership transferred
    println!("The length of '{}' is {}.", s7, len);

    // 5. Mutable references
    println!("\n=== Mutable References ===");
    let mut s8 = String::from("hello");
    println!("Before change: {}", s8);
    change(&mut s8); // Pass mutable reference
    println!("After change: {}", s8);

    // 6. Multiple references rules
    println!("\n=== Reference Rules ===");
    let mut s9 = String::from("hello");
    
    {
        let r1 = &mut s9; // First mutable borrow
        println!("r1: {}", r1);
    } // r1 goes out of scope here, so we can make a new reference
    
    let r2 = &s9; // Immutable borrow is now allowed
    let r3 = &s9; // Another immutable borrow
    println!("r2: {}, r3: {}", r2, r3);
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that works with a copy (not move) of an integer
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope, but since i32 implements Copy, nothing special happens
}

// Function that gives ownership to the caller
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // Return ownership to the caller
}

// Function that takes ownership and returns it
fn takes_and_gives_back(a_string: String) -> String {
    a_string // Return ownership to the caller
}

// Function that takes a reference (borrowing)
fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference, so no ownership is transferred
} // s goes out of scope, but nothing happens since it's just a reference

// Function that takes a mutable reference
fn change(some_string: &mut String) {
    some_string.push_str(", world!");
} // The mutable reference goes out of scope here