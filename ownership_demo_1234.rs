fn main() {
    // --- Ownership Rules Demonstration ---

    // 1. Each value in Rust has a variable that's called its owner.
    // 2. There can only be one owner at a time.
    // 3. When the owner goes out of scope, the value will be dropped.

    println!("--- Basic Ownership Transfer ---");
    {
        // `s1` owns the String value
        let s1 = String::from("hello");
        println!("s1: {}", s1);

        // `s2` takes ownership of the String value from `s1`
        // `s1` is no longer valid after this point (moved)
        let s2 = s1;

        // println!("s1: {}", s1); // This would cause a compile-time error!

        // `s2` now owns the value
        println!("s2: {}", s2);
    } // `s2` goes out of scope here and `drop` is called, freeing the memory.

    println!("\n--- Ownership with Functions ---");
    {
        let s3 = String::from("world");

        // `takes_ownership` takes ownership of `s3`
        takes_ownership(s3);

        // println!("{}", s3); // This would cause a compile-time error!

        let x = 5;

        // `makes_copy` takes ownership of `x`, but since `i32` implements `Copy`,
        // the original `x` remains valid.
        makes_copy(x);

        // `x` is still valid here because it's a `Copy` type
        println!("x is still valid after function call: {}", x);
    }

    println!("\n--- Returning Values and Scope ---");
    {
        let s4 = String::from("hello");

        // `s4` is moved into the function, and a new String is returned,
        // which is then assigned to `s5`.
        let s5 = gives_ownership(s4);

        // `s4` is no longer valid here.
        // println!("s4: {}", s4); // This would cause a compile-time error!

        println!("s5: {}", s5);

        // `s5` is moved into the function, and `s6` receives the returned value.
        let s6 = takes_and_gives_back(s5);

        // `s5` is no longer valid here.
        // println!("s5: {}", s5); // This would cause a compile-time error!

        println!("s6: {}", s6);
    } // `s6` goes out of scope and is dropped.
}

// This function takes ownership of a String. The caller's variable is invalidated.
fn takes_ownership(some_string: String) {
    println!("Received string (ownership taken): {}", some_string);
} // `some_string` goes out of scope and `drop` is called.

// This function takes ownership of an i32. However, i32 implements the `Copy` trait,
// so the original variable in the calling scope remains valid.
fn makes_copy(some_integer: i32) {
    println!("Received integer (copied): {}", some_integer);
} // `some_integer` goes out of scope. Nothing special happens as it's `Copy`.

// This function takes a String and returns one, transferring ownership back to the caller.
fn gives_ownership(some_string: String) -> String {
    some_string // `some_string` is returned and ownership is transferred.
}

// This function takes ownership and then returns it.
fn takes_and_gives_back(some_string: String) -> String {
    some_string // `some_string` is returned, moving ownership back.
}