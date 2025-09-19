// This file demonstrates Rust's ownership concept.
// 1. Each value in Rust has a variable that’s called its owner.
// 2. There can only be one owner at a time.
// 3. When the owner goes out of scope, the value will be dropped.

fn main() {
    // --- Ownership Transfer (Move) ---
    println!("--- Example 1: Ownership Transfer ---");
    let s1 = String::from("hello"); // s1 is the owner of the string data on the heap
    let s2 = s1; // The ownership of the string is moved from s1 to s2. s1 is no longer valid.
    // println!("{}", s1); // This would cause a compile-time error: value borrowed here after move
    println!("s2: {}", s2); // This is fine, s2 now owns the data.

    // --- Clone (Deep Copy) ---
    println!("\n--- Example 2: Clone ---");
    let s3 = String::from("world");
    let s4 = s3.clone(); // A deep copy is made. Both s3 and s4 are valid owners of their own data.
    println!("s3: {}", s3); // This is fine because s3 was cloned, not moved.
    println!("s4: {}", s4); // This is fine.

    // --- Copy (Stack-Only Data) ---
    println!("\n--- Example 3: Copy ---");
    let x = 5; // x is an integer, stored on the stack
    let y = x; // The value of x is copied to y. Both x and y are valid.
    println!("x: {}, y: {}", x, y); // This is fine for stack data types like integers.

    // --- Functions and Ownership ---
    println!("\n--- Example 4: Functions and Ownership ---");
    let s5 = String::from("function"); // s5 comes into scope
    takes_ownership(s5); // The value of s5 is moved into the function.
                         // s5 is no longer valid here.
    // println!("{}", s5); // This would cause a compile-time error.

    let i = 10; // i comes into scope
    makes_copy(i); // The value of i is copied into the function.
                   // i is still valid here.
    println!("i is still valid after the function call: {}", i);

    // s6 comes into scope within the function and is returned, moving ownership to s6 in main.
    let s6 = gives_ownership();
    println!("s6 received ownership: {}", s6);

    // s7's ownership is moved to the function, which transforms it and returns a new owner, s8.
    let s7 = String::from("take and return");
    let s8 = takes_and_gives_back(s7);
    println!("s8 received ownership after transformation: {}", s8);
} // s6 and s8 go out of scope here and are dropped. i goes out of scope. s5 is already gone.

fn takes_ownership(some_string: String) { // some_string comes into scope
    println!("Inside function, received string: {}", some_string);
} // some_string goes out of scope here and `drop` is called. The memory is freed.

fn makes_copy(some_integer: i32) { // some_integer comes into scope
    println!("Inside function, received integer: {}", some_integer);
} // some_integer goes out of scope here. No resources need to be freed for i32.

fn gives_ownership() -> String {
    let some_string = String::from("returned from function"); // some_string comes into scope
    some_string // some_string is returned and moves ownership to the caller
}

fn takes_and_gives_back(a_string: String) -> String { // a_string comes into scope
    a_string // a_string is returned and moves ownership to the caller
}