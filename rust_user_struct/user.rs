use serde::{Serialize, Deserialize};
use std::fs::File;
use std::io::Write;
use rand::Rng;

#[derive(Serialize, Deserialize, Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: String::from("John Doe"),
        age: 30,
    };

    // Генерируем случайное имя файла
    let mut rng = rand::thread_rng();
    let random_filename = format!("user_data_{}.json", rng.gen::<u32>());
    
    // Сериализуем структуру в JSON и записываем в файл
    let json_data = serde_json::to_string(&user).expect("Serialization failed");
    let mut file = File::create(&random_filename).expect("File creation failed");
    file.write_all(json_data.as_bytes()).expect("Write failed");
    
    println!("User data saved to file: {}", random_filename);
    println!("User: {:?}", user);
}