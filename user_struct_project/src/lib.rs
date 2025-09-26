/// Структура, представляющая пользователя.
pub struct User {
    /// Имя пользователя.
    pub name: String,
    /// Возраст пользователя.
    pub age: u32,
}

// Пример использования
fn main() {
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    println!("User: {}, Age: {}", user.name, user.age);
}