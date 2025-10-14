use std::fs::File;
use std::io::Write;

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: String::from("Алексей"),
        age: 30,
    };

    println!("Создан пользователь: {:?}", user);

    // Читаем случайное имя файла из скрытого файла
    let random_filename = std::fs::read_to_string("/workspace/rust_user_struct/.random_filename")
        .expect("Не удалось прочитать случайное имя файла")
        .trim()
        .to_string();

    let filepath = format!("/workspace/rust_user_struct/{}", random_filename);

    let mut file = File::create(filepath).expect("Не удалось создать файл");
    writeln!(file, "#[derive(Debug)]\nstruct User {{\n    name: String,\n    age: u32,\n}}").expect("Не удалось записать в файл");

    println!("Структура User сохранена в файл.");
}