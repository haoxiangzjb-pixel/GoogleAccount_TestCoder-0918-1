// Определение структуры User
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра структуры User
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Вывод информации о пользователе
    println!("User: {}, Age: {}", user.name, user.age);

    // Сохранение в файл со случайным именем
    use std::fs::File;
    use std::io::Write;
    use std::time::{SystemTime, UNIX_EPOCH};

    // Генерация случайного (уникального) имени файла на основе времени
    let time = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Time went backwards")
        .as_nanos();
    let filename = format!("user_data_{}.txt", time);

    let mut file = File::create(&filename).expect("Unable to create file");
    writeln!(file, "Name: {}", user.name).expect("Unable to write to file");
    writeln!(file, "Age: {}", user.age).expect("Unable to write to file");

    println!("User data saved to file: {}", filename);
}