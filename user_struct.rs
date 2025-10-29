use std::fs::File;
use std::io::Write;
use serde::{Deserialize, Serialize};
use serde_json;

#[derive(Serialize, Deserialize, Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("John Doe"),
        age: 30,
    };

    // Генерируем случайное имя файла
    let random_filename = format!("user_data_{}.json", generate_random_string(8));
    
    // Сериализуем структуру в JSON и записываем в файл
    let json_data = serde_json::to_string_pretty(&user)?;
    let mut file = File::create(&random_filename)?;
    file.write_all(json_data.as_bytes())?;
    
    println!("Структура пользователя сохранена в файл: {}", random_filename);
    Ok(())
}

// Функция для генерации случайной строки
fn generate_random_string(length: usize) -> String {
    use rand::Rng;
    const CHARSET: &[u8] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    let mut rng = rand::thread_rng();
    
    (0..length)
        .map(|_| {
            let idx = rng.gen_range(0..CHARSET.len());
            CHARSET[idx] as char
        })
        .collect()
}