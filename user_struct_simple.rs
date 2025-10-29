use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() -> Result<(), std::io::Error> {
    // Создаем экземпляр структуры User
    let user = User {
        name: String::from("John Doe"),
        age: 30,
    };

    // Генерируем имя файла на основе текущего времени для уникальности
    let duration = SystemTime::now().duration_since(UNIX_EPOCH)
        .expect("Time went backwards");
    let random_filename = format!("user_data_{}.txt", duration.as_nanos());

    // Записываем данные в файл
    let mut file = File::create(&random_filename)?;
    writeln!(file, "Name: {}", user.name)?;
    writeln!(file, "Age: {}", user.age)?;
    
    println!("Структура пользователя сохранена в файл: {}", random_filename);
    Ok(())
}