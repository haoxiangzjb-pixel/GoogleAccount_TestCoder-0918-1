use std::fmt;

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

impl User {
    fn new(name: String, age: u32) -> User {
        User { name, age }
    }
}

fn main() {
    let user = User::new(String::from("Alice"), 30);
    println!("User: {:?}", user);
}