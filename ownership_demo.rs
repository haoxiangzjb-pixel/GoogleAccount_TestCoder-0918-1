// Rust Ownership Concept Demonstration

fn main() {
    println!("=== Rust Ownership Concept Demo ===\n");

    // 1. Basic ownership transfer
    println!("1. Basic Ownership Transfer:");
    let s1 = String::from("hello");
    println!("s1 = {}", s1);
    
    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    // println!("s1 = {}", s1); // This would cause a compile error!
    println!("s2 = {}", s2);
    println!("s1 was moved to s2, so s1 is no longer accessible\n");

    // 2. Ownership with functions
    println!("2. Ownership with Functions:");
    let s3 = String::from("world");
    println!("Before function call, s3 = {}", s3);
    
    take_ownership(s3); // s3 is moved into the function
    // println!("s3 = {}", s3); // This would cause a compile error!
    println!("After function call, s3 is no longer valid\n");

    // 3. Returning ownership
    println!("3. Returning Ownership:");
    let s4 = String::from("rust");
    println!("Before function call, s4 = {}", s4);
    
    let s5 = return_ownership(s4); // s4 is moved to the function, then returned to s5
    println!("After function call, s5 = {}", s5);
    println!("s4 was moved but ownership was returned to s5\n");

    // 4. Borrowing (not transferring ownership)
    println!("4. Borrowing (References):");
    let s6 = String::from("borrowing");
    println!("s6 = {}", s6);
    
    let len = calculate_length(&s6); // &s6 creates a reference to s6
    println!("The length of '{}' is {}.", s6, len); // s6 is still valid here
    println!("s6 is still valid because we only borrowed it\n");

    // 5. Mutable borrowing
    println!("5. Mutable Borrowing:");
    let mut s7 = String::from("hello");
    println!("Before mutation: s7 = {}", s7);
    
    change_string(&mut s7); // &mut s7 creates a mutable reference
    println!("After mutation: s7 = {}", s7);
    println!("s7 was modified through a mutable reference\n");

    // 6. Demonstrating borrowing rules
    println!("6. Borrowing Rules:");
    let mut s8 = String::from("rules");
    
    let r1 = &s8; // immutable borrow
    let r2 = &s8; // immutable borrow
    println!("r1 and r2 are immutable references: '{}' and '{}'", r1, r2);
    
    // let r3 = &mut s8; // This would cause a compile error!
    // println!("{} {} {}", r1, r2, r3);
    
    let r3 = &mut s8; // mutable borrow (allowed after immutable borrows are done)
    println!("r3 is a mutable reference: '{}'", r3);
    println!("Only one mutable reference or multiple immutable references allowed at a time\n");
}

// Function that takes ownership of a string
fn take_ownership(some_string: String) {
    println!("Received ownership of: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that returns ownership of a string
fn return_ownership(some_string: String) -> String {
    println!("Received ownership and will return it: {}", some_string);
    some_string // returning ownership back to caller
}

// Function that borrows (takes a reference to) a string
fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference, so it doesn't take ownership
} // s goes out of scope here, but since it doesn't own the value, nothing happens

// Function that mutably borrows a string
fn change_string(s: &mut String) {
    s.push_str(", world!"); // modifies the original string through the mutable reference
}