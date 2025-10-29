/// Структура для представления пользователя
/// Содержит два поля: имя и возраст
#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

// Пример использования структуры
fn main() {
    let user = User {
        name: String::from("John Doe"),
        age: 30,
    };
    
    println!("User created: {:?}", user);
}