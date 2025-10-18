use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};
use rand::Rng;

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

    // Generate a random filename using current timestamp and random number
    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards")
        .as_secs();
    let mut rng = rand::thread_rng();
    let random_suffix = rng.gen::<u32>();
    let filename = format!("user_data_{}_{}.json", now, random_suffix);

    // Serialize user data to JSON manually
    let json_data = format!(
        r#"{{"name": "{}", "age": {}}}"#,
        user.name, user.age
    );

    let mut file = File::create(&filename).expect("Unable to create file");
    file.write_all(json_data.as_bytes()).expect("Unable to write data");

    println!("User data saved to file: {}", filename);
}