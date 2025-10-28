use std::fs::File;
use std::io::Write;
use serde::{Serialize, Deserialize};
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
    let random_number: u32 = rng.gen();
    let filename = format!("user_data_{}.json", random_number);
    
    // Сохраняем структуру в файл в формате JSON
    let json = serde_json::to_string_pretty(&user).unwrap();
    let mut file = File::create(&filename).unwrap();
    file.write_all(json.as_bytes()).unwrap();

    println!("Структура пользователя сохранена в файл {}", filename);
    println!("Данные: {:?}", user);
}