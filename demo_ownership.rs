fn main() {
    // --- Ownership Rules Demonstration ---

    // 1. Each value in Rust has a variable that's called its owner.
    // 2. There can only be one owner at a time.
    // 3. When the owner goes out of scope, the value will be dropped.

    println!("--- Basic Ownership Transfer ---");

    // `s1` owns the String value
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // `s2` takes ownership of the String value from `s1`
    // `s1` is no longer valid after this line. This is a "move".
    let s2 = s1;

    // The following line would cause a compile-time error because `s1` was moved.
    // println!("s1: {}", s1); // Error: value borrowed here after move

    // `s2` now owns the String value.
    println!("s2: {}", s2);

    println!("\n--- Ownership with Functions ---");

    let s3 = String::from("world");
    println!("s3 before function call: {}", s3);

    // `takes_ownership` takes ownership of `s3`.
    takes_ownership(s3);

    // `s3` is no longer valid here because it was moved into the function.
    // println!("s3 after function call: {}", s3); // Error: value borrowed here after move

    // `makes_copy` takes a copy of `x1`, not the original.
    let x1 = 5;
    println!("x1 before function call: {}", x1);
    makes_copy(x1);
    // `x1` is still valid here because integers are copied, not moved.
    println!("x1 after function call: {}", x1);

    println!("\n--- Ownership and References (Borrowing) ---");

    let s4 = String::from("Rust");
    println!("s4 before borrowing: {}", s4);

    // `calculate_length` borrows `s4`, it does not take ownership.
    let len = calculate_length(&s4);
    println!("The length of '{}' is {}.", s4, len);

    // `s4` is still valid here because it was only borrowed.
    println!("s4 after borrowing: {}", s4);

    // Demonstrate mutable borrowing
    let mut s5 = String::from("Hi");
    println!("s5 before mutable borrow: {}", s5);
    change(&mut s5);
    println!("s5 after mutable borrow: {}", s5);

    // Demonstrate scope rules with borrowing
    {
        let r = &mut s5; // `r` is a mutable reference to `s5`
        // let r2 = &s5; // This would be an error: cannot borrow `s5` as immutable because it is also borrowed as mutable
        *r = String::from("Hello"); // Modify through the mutable reference
        // `r` goes out of scope here, so we can borrow `s5` again outside the block
    }
    println!("s5 after block: {}", s5);
}

// This function takes ownership of the String passed to it.
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // `some_string` goes out of scope here and `drop` is called.
    // The memory is freed.
}

// This function takes a copy of the integer passed to it.
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // `some_integer` goes out of scope here, but nothing happens.
    // Integers are simple values and are copied, not moved.
}

// This function takes a reference to a String, it borrows it.
fn calculate_length(s: &String) -> usize {
    s.len()
    // `s` goes out of scope, but since it does not own the underlying data,
    // nothing happens to the original String.
}

// This function takes a mutable reference to a String.
fn change(some_string: &mut String) {
    some_string.push_str(", World!");
    // `some_string` goes out of scope, but since it was a mutable borrow,
    // the original String is modified.
}