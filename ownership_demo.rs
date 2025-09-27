fn main() {
    // --- Ownership Rules Demonstration ---

    // 1. Each value in Rust has a variable that's called its owner.
    // 2. There can only be one owner at a time.
    // 3. When the owner goes out of scope, the value will be dropped.

    println!("--- Basic Ownership Transfer ---");
    {
        let s1 = String::from("hello"); // s1 owns the String
        println!("s1: {}", s1);

        let s2 = s1; // Ownership of the String is *moved* from s1 to s2
        // s1 is now invalid and cannot be used. This prevents double-free errors.
        // println!("s1: {}", s1); // This would cause a compile-time error!
        println!("s2: {}", s2); // s2 is the new owner
    } // s2 goes out of scope here and is dropped.

    println!("\n--- Ownership with Functions ---");
    {
        let s3 = String::from("world");
        println!("s3 before function call: {}", s3);

        // Passing s3 to the function transfers ownership to the function parameter `s`.
        let s4 = takes_ownership(s3);
        // s3 is no longer valid here.

        // The function returns ownership back to s4.
        println!("s4 after function call: {}", s4);
    } // s4 goes out of scope and is dropped.

    println!("\n--- Copy Types (Not Moved) ---");
    {
        let x = 5; // i32 implements the Copy trait
        let y = x; // x is *copied*, not moved. Both x and y are valid.
        println!("x: {}, y: {}", x, y);
    } // x and y go out of scope.

    println!("\n--- Borrowing ---");
    {
        let s5 = String::from("hello");
        // We pass a reference (&s5) to the function, not the value itself.
        // The function borrows the value; ownership does not change.
        let len = calculate_length(&s5);
        println!("The length of '{}' is {}.", s5, len); // s5 is still valid here.

        // Mutable borrowing
        let mut s6 = String::from("hi");
        println!("s6 before mutation: {}", s6);
        change(&mut s6); // Pass a mutable reference
        println!("s6 after mutation: {}", s6); // s6 is still valid and modified.
    }
}

// Function that takes ownership of a String
fn takes_ownership(s: String) -> String {
    println!("Received string: {}", s);
    // `s` goes out of scope here, but the function returns it,
    // transferring ownership back to the caller.
    s
}

// Function that borrows a reference to a String
fn calculate_length(s: &String) -> usize {
    // `s` is a reference to a String. It does not own the data.
    s.len() // We can use the methods of the referenced value.
    // `s` goes out of scope here, but since it doesn't own the data,
    // nothing happens to the original String.
}

// Function that mutably borrows a reference to a String
fn change(s: &mut String) {
    // `s` is a mutable reference.
    s.push_str(", world"); // We can modify the data it refers to.
    // `s` goes out of scope, but the original String is modified.
}