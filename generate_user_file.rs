use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Generate a random filename using current timestamp
    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards")
        .as_secs();
    let filename = format!("user_data_{}.txt", now);

    // Write user data to file in a simple format
    let data = format!("Name: {}\nAge: {}", user.name, user.age);

    let mut file = File::create(&filename).expect("Unable to create file");
    file.write_all(data.as_bytes()).expect("Unable to write data");

    println!("User data saved to file: {}", filename);
}