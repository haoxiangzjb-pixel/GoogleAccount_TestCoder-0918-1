// Rust Ownership Demo
// This code demonstrates the core concepts of ownership in Rust

fn main() {
    println!("=== Rust Ownership Demo ===\n");

    // 1. Ownership basics
    println!("1. Ownership Basics:");
    let s1 = String::from("hello");
    println!("s1 = {}", s1);

    // Moving ownership - s1 is no longer valid after this
    let s2 = s1;  // s1's ownership is moved to s2
    // println!("s1 = {}", s1); // This would cause a compile error!
    println!("s2 = {}", s2);
    println!("(s1 is no longer valid after move)\n");

    // 2. Function ownership transfer
    println!("2. Function Ownership Transfer:");
    let s3 = String::from("world");
    println!("Before function call, s3 = {}", s3);
    let len = calculate_length(s3); // s3 is moved into the function
    // println!("After function call, s3 = {}", s3); // This would cause a compile error!
    println!("Length returned from function = {}", len);
    println!("(s3 is no longer valid after being passed to function)\n");

    // 3. Borrowing (using references)
    println!("3. Borrowing with References:");
    let s4 = String::from("Rust");
    println!("s4 = {}", s4);
    let len2 = calculate_length_with_reference(&s4); // s4 is borrowed, not moved
    println!("After function call, s4 = {}", s4); // This works because s4 wasn't moved
    println!("Length from borrowed reference = {}", len2);
    println!("(s4 is still valid after borrowing)\n");

    // 4. Mutable borrowing
    println!("4. Mutable Borrowing:");
    let mut s5 = String::from("Hello");
    println!("Before mutation: s5 = {}", s5);
    change_string(&mut s5); // Pass a mutable reference
    println!("After mutation: s5 = {}", s5);
    println!();

    // 5. Multiple immutable references OR one mutable reference (but not both)
    println!("5. Borrowing Rules:");
    let mut s6 = String::from("test");
    
    // Multiple immutable references are allowed
    let r1 = &s6;
    let r2 = &s6;
    println!("r1 and r2 (immutable refs) can coexist: '{}' and '{}'", r1, r2);
    
    // Mutable reference - this is allowed only when no immutable references exist
    let r3 = &mut s6;
    println!("Now we have a mutable reference: '{}'", r3);
    println!("(r1 and r2 are no longer accessible at this point)");
}

// Function that takes ownership of a String
fn calculate_length(s: String) -> usize {
    s.len()
    // s goes out of scope here and is dropped
}

// Function that borrows a reference to a String (doesn't take ownership)
fn calculate_length_with_reference(s: &String) -> usize {
    s.len()
    // s is just a reference, so nothing is dropped when it goes out of scope
}

// Function that mutably borrows a string to modify it
fn change_string(s: &mut String) {
    s.push_str(", World!");
}