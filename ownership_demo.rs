// Rust Ownership Demo
// This program demonstrates Rust's ownership system including:
// - Ownership transfer
// - Borrowing
// - Move semantics
// - String and vector ownership

fn main() {
    println!("=== Rust Ownership Demo ===\n");

    // 1. Basic ownership - variable binding
    println!("1. Basic ownership:");
    let s1 = String::from("Hello");
    println!("s1 = {}", s1);
    
    // 2. Ownership transfer (move)
    println!("\n2. Ownership transfer (move):");
    let s2 = s1; // s1's ownership is moved to s2
    // println!("s1 = {}", s1); // This would cause a compile error!
    println!("s2 = {}", s2);
    println!("s1 is no longer valid after the move");

    // 3. Cloning to avoid move
    println!("\n3. Cloning to avoid move:");
    let s3 = String::from("World");
    let s4 = s3.clone(); // Deep copy, both s3 and s4 are valid
    println!("s3 = {}", s3);
    println!("s4 = {}", s4);

    // 4. Function ownership transfer
    println!("\n4. Function ownership transfer:");
    let s5 = String::from("Owned by function");
    take_ownership(s5); // s5 is moved to the function
    // println!("s5 = {}", s5); // This would cause a compile error!

    let s6 = String::from("Returned to main");
    let s7 = give_ownership(s6); // s6 is moved to function, s7 gets ownership back
    println!("s7 = {}", s7);

    // 5. Borrowing (references)
    println!("\n5. Borrowing (references):");
    let s8 = String::from("Borrowed string");
    let len = calculate_length(&s8); // Borrow s8 without taking ownership
    println!("The length of '{}' is {}.", s8, len);

    // 6. Mutable borrowing
    println!("\n6. Mutable borrowing:");
    let mut s9 = String::from("Hello");
    println!("Before modification: {}", s9);
    change_string(&mut s9); // Borrow mutably
    println!("After modification: {}", s9);

    // 7. Vector ownership
    println!("\n7. Vector ownership:");
    let v1 = vec![1, 2, 3, 4];
    let v2 = v1; // v1 is moved to v2
    // println!("v1 = {:?}", v1); // This would cause a compile error!
    println!("v2 = {:?}", v2);

    // 8. Multiple immutable references vs mutable reference
    println!("\n8. Multiple immutable references vs mutable reference:");
    let mut s10 = String::from("Multiple references demo");
    
    // Multiple immutable references are allowed
    let r1 = &s10;
    let r2 = &s10;
    println!("r1: {}", r1);
    println!("r2: {}", r2);
    
    // But we can't have a mutable reference while immutable ones exist
    // let r3 = &mut s10; // This would cause a compile error
    
    // However, after r1 and r2 go out of scope, we can create a mutable reference
    {
        println!("r1: {}, r2: {}", r1, r2); // Using r1 and r2
    } // r1 and r2 go out of scope here
    
    let r3 = &mut s10; // Now this is allowed
    r3.push_str(" - modified");
    println!("r3: {}", r3);

    println!("\n=== End of Ownership Demo ===");
}

// Function that takes ownership of a string
fn take_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that takes a string and returns ownership
fn give_ownership(mut some_string: String) -> String {
    some_string.push_str(" (modified by function)");
    some_string // Return ownership to caller
}

// Function that borrows a string (immutable reference)
fn calculate_length(s: &String) -> usize {
    s.len() // s is dropped here, but ownership doesn't transfer
}

// Function that mutably borrows a string
fn change_string(s: &mut String) {
    s.push_str(", World!");
    // s is dropped here but ownership doesn't transfer
}