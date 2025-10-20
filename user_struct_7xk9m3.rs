// Структура пользователя с полями имя и возраст
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра структуры
    let user = User {
        name: String::from("Иван"),
        age: 30,
    };
    
    println!("Создан пользователь: {} ({} лет)", user.name, user.age);
    
    // Сохранение данных в файл
    use std::fs::File;
    use std::io::Write;
    
    let mut file = File::create("user_data.txt").expect("Не удалось создать файл");
    writeln!(file, "Имя: {}", user.name).expect("Не удалось записать имя");
    writeln!(file, "Возраст: {}", user.age).expect("Не удалось записать возраст");
    
    println!("Данные пользователя сохранены в файл user_data.txt");
}